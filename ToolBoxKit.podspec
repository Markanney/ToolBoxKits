#
# Be sure to run `pod lib lint ToolBoxKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ToolBoxKit'
  s.version          = '0.0.4'
  s.summary = "A lightweight Swift toolbox for common extensions and utilities in iOS development."
  s.description = <<-DESC
  toolBox provides a collection of Swift extensions and helper utilities to simplify iOS development,
  including UIKit helpers, string processing, async utilities, and layout helpers.
  DESC

  s.homepage         = 'https://github.com/Markanney/ToolBoxKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kanney' => 'mail@workpassion.top' }
  s.source           = { :git => 'https://github.com/Markanney/ToolBoxKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'ToolBoxKit/Classes/**/*'
  
  #   s.resource_bundles = {
  #     'toolBox' => ['toolBox/Assets/*']
  #   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'KingfisherWebP'
   s.dependency 'SwiftMessages'
end
