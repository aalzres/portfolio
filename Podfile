project 'PORTFOLIO.xcodeproj'

# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'PORTFOLIO' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PORTFOLIO
      pod 'GoogleMaps', '7.1.0'

      post_install do |installer|
        installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
            # Force CocoaPods targets to always build for x86_64
            config.build_settings['ARCHS[sdk=iphonesimulator*]'] = 'x86_64'
          end
        end
      end
end
