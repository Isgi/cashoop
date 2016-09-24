# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
    pod 'RxSwift',    '~> 2.0'
    pod 'RxCocoa',    '~> 2.0'
    pod 'Alamofire', '~> 3.0.0'
    pod 'SwiftyJSON', '~> 2.3.0'
end

target 'Cashoop' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  rx_swift
  use_frameworks!

  # Pods for Cashoop

  target 'CashoopTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CashoopUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
