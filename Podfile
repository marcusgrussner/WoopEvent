inhibit_all_warnings!

def shared_pods
  pod 'Alamofire'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'
  pod 'SwiftLint'
  pod 'SwiftGen'
end

target 'WoopEvent' do
  shared_pods
  
  target 'WoopEventTests' do
    inherit! :search_paths
    shared_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'SnapshotTesting', '~> 1.8.1'
  end
end
