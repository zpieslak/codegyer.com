require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "http://codegyver.net"
SitemapGenerator::Sitemap.create do
  add services_path
  add projects_path
  add contact_path
  add posts_path
  Project.find_each do |project|
    add project_path(project)
  end
  Post.find_each do |post|
    add post_path(post), lastmod: (post.updated_at || post.created_at)
  end
end
