module ActiveAdmin::ViewHelper
  def app_version
    filename = File.join(Rails.root, 'REVISION')
    File.read(filename) if File.exist?(filename)
  end
end
