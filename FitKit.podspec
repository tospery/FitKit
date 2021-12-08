#
# Be sure to run `pod lib lint FitKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FitKit'
  s.version          = '0.0.1'
  s.summary          = 'Fit the system/screen for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
						Fit the system/screen for iOS
                       DESC

  s.homepage         = 'https://github.com/tospery/FitKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YangJianxiang' => 'tospery@gmail.com' }
  s.source           = { :git => 'https://github.com/tospery/FitKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.requires_arc = true
  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'FitKit/Classes/**/*'
  
  s.frameworks = 'UIKit'
  s.dependency 'DeviceKit', '4.5.2'
end
