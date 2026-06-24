Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '14.0'
s.name = "DHLLoadingAnimation"
s.summary = "Animacion de cargando"
s.requires_arc = true

s.version = "1.0.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Daniel Hernandez Lopez" => "hzlzdaniel@gmail.com" }

s.homepage = "https://github.com/daniel-herlop/DHLLoadingAnimation"

s.source = { :git => "https://github.com/daniel-herlop/DHLLoadingAnimation.git", 
             :tag => "#{s.version}" }

s.framework = "UIKit"
s.dependency 'lottie-ios'

s.source_files = "DHLLoadingAnimation/**/*.{swift}"

s.resources = "DHLLoadingAnimation/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,strings,json}"

s.swift_version = "5.0"

end