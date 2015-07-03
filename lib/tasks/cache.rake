namespace :pages do
  desc 'Cache all the pages'
  task cache: :environment do
    # First, let's instantiate a new session so we can `get` our paths,
    # just like if we were writing an integration test
    app = ActionDispatch::Integration::Session.new Rails.application

    gz = Zlib::GzipReader.new File.open([Rails.root, 'public', 'sitemap.xml.gz'].join('/'))
    doc = Nokogiri::XML gz.read
    links = doc.css('loc').map { |l| URI(l.text).path } + ['/contact/success']

    ## Now, we'll loop through each path we want to cache
    links.each do |path|
      # Get the path
      app.get path
    end
  end
end
