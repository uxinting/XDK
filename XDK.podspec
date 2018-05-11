#
# Be sure to run `pod lib lint XDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XDK'
  s.version          = '0.1.0'
  s.summary          = 'xinting develop kit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
工具集，控件集合，网络库，列表，富文本，导航器
                       DESC

  s.homepage         = 'https://github.com/uxinting/XDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'uxinting' => 'wu.xinting@hotmail.com' }
  s.source           = { :git => 'https://github.com/uxinting/XDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'XDK/**/*.swift'
  
  s.resource_bundles = {
    'XDK' => ['XDK/Res/**/*']
  }

  s.frameworks = 'UIKit', 'CoreLocation'
  s.dependency 'EVReflection', '~> 5.6'
  s.dependency 'XDP', '~> 0.1'
  # s.dependency 'AFNetworking', '~> 2.3'
end
