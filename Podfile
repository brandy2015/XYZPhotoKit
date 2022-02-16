# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'
 

target 'XYZPhotoKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
	  
	pod 'TLPhotoPicker'
	pod 'JXPhotoBrowser'        #点按照片后左右浏览
 	pod 'XYZPathKit'  # 自己的文件路径管理
	pod 'Kingfisher'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
