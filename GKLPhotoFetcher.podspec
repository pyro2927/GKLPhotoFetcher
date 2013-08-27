Pod::Spec.new do |s|
  s.name         = "GKLPhotoFetcher"
  s.version      = "0.0.2"
  s.summary      = "An easy way to get photos from your user."
  s.homepage     = "http://github.com/pyro2927/GKLPhotoFetcher"
  s.author       = { "pyro2927" => "joseph@pintozzi.com" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.source       = { :git => "https://github.com/pyro2927/GKLPhotoFetcher.git", :tag => "0.0.2" }
  s.platform     = :ios, '5.0'
  s.source_files = 'PhotoFetcher/GKLPhotoFetcher.{h,m}'
  s.requires_arc = true
end
