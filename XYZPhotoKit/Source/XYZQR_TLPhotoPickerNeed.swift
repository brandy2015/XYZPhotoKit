//
//  XYZQR_TLPhotoPickerNeed.swift
//  XYZPhotoKit
//
//  Created by 张子豪 on 2020/7/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import TLPhotoPicker
import Photos

//XYZQR_TLPhotoPickerNeed
public extension XYZTLPhotoPickerObject{
    //以下的是从相册选择二维码
    func pickerButtonTap(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.mediaType = PHAssetMediaType.image
        //        if 是会员可以多选很多张
        configure.singleSelectedMode = true
        configure.maxSelectedAssets = 9
        //设定什么照片可以导入
        configure.numberOfColumn = numberOfColumn
        configure.usedCameraButton = true
        //        configure.allowedVideo = false
        configure.allowedAlbumCloudShared = false
        configure.allowedVideoRecording = false
//        configure.doneTitle = doneTitle
        //                let options = PHFetchOptions()
        //                options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        //
        //                configure.fetchOption = options
        
        viewController.configure = configure
        //        viewController.canSelectAsset = { [weak self] asset -> Bool in
        //            if asset.mediaSubtypes ==
        //            if asset.pixelHeight < 100 || asset.pixelWidth < 100 {
        //                self?.showUnsatisifiedSizeAlert(vc: viewController)
        //                return false
        //            }
        //            return true
        //        }
        VC.present(viewController, animated: true, completion: nil)
    }
    
    
    
    //    var selectedAssets = [TLPHAsset]()
    
    //1.背景图片
    func 添加背景图片Picker(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
            //            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.numberOfColumn = numberOfColumn
        configure.singleSelectedMode = true
        configure.usedCameraButton = true
        configure.allowedVideo = false
//        configure.doneTitle = doneTitle
        viewController.configure = configure
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    //2.Gif
    func PickGIFToGenerate(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
            //            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.fetchCollectionTypes = [(.smartAlbum, .smartAlbumAnimated)]//选择GIF的picker特殊设置
        configure.numberOfColumn = numberOfColumn
        configure.singleSelectedMode = false
        configure.supportedInterfaceOrientations = [.all]
        configure.maxSelectedAssets = 1
        configure.usedCameraButton = false
        configure.allowedVideo = false
//        configure.doneTitle = doneTitle
        viewController.configure = configure
        //        viewController.selectedAssets = self.selectedAssets
        viewController.modalPresentationStyle = .fullScreen
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    //3.选择Logo
    func 弹出PhotoPickerToPickLogo(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        
        
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
            //            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        
        configure.numberOfColumn = numberOfColumn
        configure.singleSelectedMode = true
        configure.usedCameraButton = true
        configure.allowedVideo = false
//        configure.doneTitle = doneTitle
        viewController.configure = configure
        //            viewController.selectedAssets = self.selectedAssets
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    
    
    
}

extension XYZTLPhotoPickerObject{
    
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
