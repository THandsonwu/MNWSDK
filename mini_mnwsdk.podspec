#
# Be sure to run `pod lib lint mini_mnwsdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mini_mnwsdk'
  s.version          = '0.1.0'
  s.summary          = 'MNWSDK is use to easily login with mini1 and other plaforms'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                      MNWSDK is make to login easily for mini1 and other plaforms
                      like: facebook, google, apple...
                       DESC

  s.homepage         = 'https://github.com/THandsonwu/MNWSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taki' => 'tanzhiwu@mini1.cn' }
  s.source           = { :git => 'https://github.com/THandsonwu/MNWSDK.git', :tag => s.version.to_s }
  #s.plaform = :ios
  s.ios.deployment_target = '12.0'
  s.default_subspec = 'MNWSDK'
  
  #主模块
  s.subspec 'MNWSDK' do |sp|
      sp.frameworks = 'Foundation'
      sp.vendored_frameworks = 'MNWSDK/MNWSDK.framework'
  end
  
  s.subspec 'MNWSDKPlatforms' do |sp|
      #Facebook
      sp.subspec 'Facebook' do |ssp|
          ssp.vendored_frameworks = 'MNWSDK/PlatformSDK/FacebookSDK/*.framework','MNWSDK/PlatformComm/FacebookComm.framework'
          ssp.library = 'c++', 'stdc++','z'
          ssp.ios.weak_framework = 'Accelerate', 'Accounts', 'CoreLocation', 'Social', 'Security', 'QuartzCore', 'CoreGraphics','UIKit', 'AudioToolbox','AuthenticationServices','SafariServices','CoreServices'
          ssp.resources = 'MNWSDK/PlatformSDK/Facebook/*.bundle'
          ssp.dependency 'mini_mnwsdk/MNWSDK'
      end
      #GooglePlus
      sp.subspec 'GooglePlus' do |ssp|
          ssp.vendored_frameworks = 'MNWSDK/PlatformSDK/GoogleSDK/*.framework','MNWSDK/PlatformComm/GooglePlusComm.framework'
          ssp.ios.weak_framework = 'LocalAuthentication'
          ssp.resources = 'MNWSDK/PlatformSDK/GoogleSDK/*.bundle'
          ssp.dependency 'mini_mnwsdk/MNWSDK'
      end
      #Apple
      sp.subspec 'Apple' do |ssp|
          ssp.vendored_frameworks = 'MNWSDK/PlatformComm/AppleComm.framework'
          ssp.ios.weak_framework = 'AuthenticationServices'
          ssp.dependency 'mini_mnwsdk/MNWSDK'
      end
  end
   
end
