#
# Be sure to run `pod lib lint FR_Components.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FR_Components'
  s.version          = '1.0.0'
  s.summary          = 'FR_Components is central component of presentation layer for 4Rest'
  s.description      = '4Rest is Core Framework of iOS that consists of Data mapping, Merge data, Network manager, Security, Database manager and Presentation manager'
  s.homepage         = 'https://github.com/TzoaniTon/FR_Components'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = {
      'Sarinthon Mangkorn-ngam' => 'darksky_ddd@hotmail.com',
      'Lalida Jaritsup' => 'lalida.jar@gmail.com'
  }
  s.source           = {
      :git => 'https://github.com/TzoaniTon/FR_Components.git',
      :tag => s.version.to_s
  }

  # Platform required #

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.requires_arc = true

  # File Structure #
  
  s.source_files = 'FR_Components/Classes/**/*.swift'
  s.resources = [
    'FR_Components/Classes/**/*.xib'
  ]
  
  # Dependency #
  
  s.dependency 'FR_BaseComponent', '~> 1.0'
  
end
