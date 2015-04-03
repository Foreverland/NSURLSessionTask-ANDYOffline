Pod::Spec.new do |s|
s.name             = "NSURLSessionTask-ANDYOffline"
s.version          = "0.1"
s.summary          = "A short description of NSURLSessionTask-ANDYOffline."
s.description      = <<-DESC
An optional longer description of NSURLSessionTask-ANDYOffline

* Markdown format.
* Don't worry about the indent, we strip it!
DESC
s.homepage         = "https://github.com/3lvis/NSURLSessionTask-ANDYOffline"
s.license          = 'MIT'
s.author           = { "Elvis Nuñez" => "hello@nselvis.com" }
s.source           = { :git => "https://github.com/3lvis/NSURLSessionTask-ANDYOffline.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/3lvis'
s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files = 'Source/**/*'
# s.frameworks = 'UIKit', 'MapKit'
end
