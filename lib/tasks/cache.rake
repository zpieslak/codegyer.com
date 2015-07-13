namespace :pages do
  desc 'Invoke sitemap and cache'
  task cache_all: ['sitemap:refresh:no_ping', 'pages:cache']

  desc 'Cache all the pages'
  task cache: :environment do
    # First, let's instantiate a new session so we can `get` our paths, just like if we were writing an integration test
    app = ActionDispatch::Integration::Session.new Rails.application

    # Get links from sitemap
    gz = Zlib::GzipReader.new File.open([Rails.root, 'public', 'sitemap.xml.gz'].join('/'))
    doc = Nokogiri::XML gz.read
    paths = doc.css('loc').map { |l| URI(l.text).path } + ['/contact/success']

    # Now, we'll loop through each path we want to cache
    paths.each do |path|
      app.get path
      p path
    end
  end
end
