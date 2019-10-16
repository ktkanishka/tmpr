# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!

def shared_pods
    pod 'Alamofire', '~> 4.5'
    pod 'AlamofireObjectMapper', '~> 5.0'
    pod 'SwiftyJSON'
    pod 'Kingfisher', '~> 4.0'
    pod 'ShimmerSwift'
    
    pod 'PKHUD', '~> 5.0'
    pod 'RxSwift',    '~> 4.0'
#    pod 'RxCocoa',    '~> 4.0'
    pod 'Result'
#    pod 'RxBlocking'
#    pod 'RxOptional'

#    pod 'Moya', '~> 11.0'
#    pod 'DLRadioButton', '~> 1.4'

    pod 'SwiftMessages', '~> 5.0'
    pod 'Toast-Swift', '~> 4.0.0'
end

target 'Tmpr' do
      # Pods for Tmpr
      shared_pods

      target 'TmprTests' do
        inherit! :search_paths
        # Pods for testing
      end

      target 'TmprUITests' do
        inherit! :search_paths
        # Pods for testing
      end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['Eureka', 'PopupDialog', 'SideMenu', 'NotificationBannerSwift', 'GrowingTextView', 'Toast-Swift'].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end

