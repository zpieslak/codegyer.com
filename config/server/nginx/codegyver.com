upstream unicorn_codegyver {
  server unix:/home/deploy/apps/codegyver/current/tmp/sockets/unicorn.sock fail_timeout=0;
}

server {
  server_name www.codegyver.com;
  rewrite ^(.*) http://codegyver.com permanent;
}

server {
  listen 80;
  server_name codegyver.com;
  root /home/deploy/apps/codegyver/current/public;

  location ^~ /assets/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
  }

  try_files $uri /cache/$uri/index.html /cache/$uri.html /cache/$uri @unicorn_codegyver;

  location @unicorn_codegyver {
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_redirect off;
    proxy_pass http://unicorn_codegyver;
  }

  client_max_body_size 8M;
}
