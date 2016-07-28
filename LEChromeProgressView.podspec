Pod::Spec.new do |s|
  s.name         = "LEChromeProgressView"
  s.version      = "0.0.1"
  s.summary      = "prgress view like the one on Chrome's tab bar"
!
  s.description  = <<-DESC
prgress view like the one on Chrome's tab bar
                   DESC

  s.homepage     = "https://github.com/leavez/LEPhotoCollectionView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example
  s.license      = "MIT"
  s.author       = "Leave"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/leavez/LEChromeProgressView", :tag => "0.0.1" }
  s.source_files  = "LEChromeProgressView/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true
  s.dependency "DACircularProgress", "~> 2.3.1"

end
