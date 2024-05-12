Pod::Spec.new do |s|
  s.name             = 'YFAdsSDK'
  s.version          = '1.7.0'
  s.summary          = 'A ads collection of iOS.'
  s.homepage         = 'https://github.com/Jentlezhi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jentle' => 'juntaozhi@163.com' }
  s.source           = { :git => 'https://github.com/Jentlezhi/YFAdsSDK.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
#  s.vendored_frameworks = 'YFAdsSDK/YFAdsSDK.xcframework'
#  s.subspec 'Public' do |ss|
#      ss.source_files = 'YFAdsSDK/YFAdsSDK.xcframework'
#  end
#  s.source_files = 'YFAdsSDK/YFAdsSDK.xcframework'
  #公共
  s.subspec 'Core' do |ss|
      ss.vendored_frameworks = 'YFAdsSDK/YFAdsSDK.xcframework'
  end
  #依赖库
  s.dependency 'AFNetworking'
  #百青藤
  s.subspec 'YFBDSDK' do |ss|
    ss.subspec 'BaiduMobAdSDK' do |sss|
        sss.dependency 'BaiduMobAdSDK','5.34'
        sss.dependency 'YFAdsSDK/Core'
    end
  end
  #快手
  s.subspec 'YFKSSDK' do |ss|
    ss.subspec 'BaiduMobAdSDK' do |sss|
        sss.dependency 'KSAdSDK','3.3.61'
        sss.dependency 'YFAdsSDK/Core'
    end
  end
  #优量汇
  s.subspec 'YFYLHSDK' do |ss|
    ss.subspec 'BaiduMobAdSDK' do |sss|
        sss.dependency 'GDTMobSDK','4.14.76'
        sss.dependency 'YFAdsSDK/Core'
    end
  end
  #穿山甲
  s.subspec 'YFCSJSDK' do |ss|
    ss.subspec 'BaiduMobAdSDK' do |sss|
        sss.dependency 'Ads-CN','5.9.1.6'
        sss.dependency 'YFAdsSDK/Core'
    end
  end
#  s.dependency 'BaiduMobAdSDK','5.34'
#  s.dependency 'KSAdSDK','3.3.61'
#  s.dependency 'GDTMobSDK','4.14.76'
#  s.dependency 'Ads-CN','5.9.1.6'
  
end
