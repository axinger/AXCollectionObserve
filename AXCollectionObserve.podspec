#
# Be sure to run `pod lib lint AXCollectionObserve.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AXCollectionObserve'
  s.version          = '1.1.1'
  s.summary          = 'A short description of AXCollectionObserve.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OC集合监听
                       DESC

  s.homepage         = 'https://github.com/axinger/AXCollectionObserve'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'axinger' => 'liu_weixing@qq.com' }
  s.source           = { :git => 'https://github.com/axinger/AXCollectionObserve.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.public_header_files = 'AXCollectionObserve/AXCollectionObserve.h'
  #s.source_files = 'AXCollectionObserve/Classes/**/*'
  s.source_files = 'AXCollectionObserve/AXCollectionObserve.h'
  # 虚拟文件夹
  s.subspec 'Core' do |ss|
    ss.source_files = 'AXCollectionObserve/Classes/Core/*.{h,m}'
  end
  
  s.subspec 'Component' do |ss|
    ss.dependency 'AXCollectionObserve/Core'
    ss.source_files = 'AXCollectionObserve/Classes/Component/*.{h,m}'
  end
  
  # s.resource_bundles = {
  #   'AXCollectionObserve' => ['AXCollectionObserve/Assets/*.png']
  # }

  s.frameworks = 'Foundation'
  s.dependency 'ReactiveObjC','>= 3.0.0'
  
end
