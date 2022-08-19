# Uncomment the next line to define a global platform for your project
platform :ios, '10'

target 'myListMovie_PucMinas' do
  use_frameworks!
  pod 'Alamofire', '~> 5.0.0-rc.3'
end
target 'myListMovie_PucMinasTests' do
  inherit! :search_paths
  # Pods for testing
end
target 'myListMovie_PucMinasUITests' do
  # Pods for testing
end
