# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SCON_iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for SCON_iOS
  pod 'Tabman', '~> 2.12'
  pod "youtube-ios-player-helper"
  pod 'JJFloatingActionButton'
  pod 'lottie-ios'
  pod 'Kingfisher'
  pod 'Firebase/Auth'
  pod 'ImageSlideshow', '~> 1.9.0'


end


post_install do |pi|
     pi.pods_project.targets.each do |t|
       t.build_configurations.each do |config|
         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
       end
     end
 end
