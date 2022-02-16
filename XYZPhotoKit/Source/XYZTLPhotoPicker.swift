//
//  XYZTLPhotoPicker.swift
//  XYZPhotoKit
//
//  Created by 张子豪 on 2020/7/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import TLPhotoPicker
import Photos


public var XYZTLPhotoPicker = XYZTLPhotoPickerObject()
public class XYZTLPhotoPickerObject {
}

public enum SelectWhichOne:String{
    
    case 视频转Live照片
    case 强制转换视频转Live照片
    
    case 转为GIF
    case 视频转为GIF
    case Live照片转GIF
    
    case Live照片转视频
    case Live照片转Lmr
    case 管理与还原Lmr
    case 全景照片
    case 开启会员
    case GIF转视频
    
}


//XYZMaker_TLPhotoPickerNeed

public extension XYZTLPhotoPickerObject{
    
    //1.视频转Live照片
    func PickVideoToLivePhoto(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        
        
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.supportedInterfaceOrientations = [.all]
        configure.mediaType = .video
        configure.numberOfColumn = numberOfColumn
//        configure. = doneTitle
        //如果是会员在这个进行判断
        
        //        if VTLMakerSystemSet.读取是否购买VR360(){
        //            configure.singleSelectedMode = false
        //            configure.maxSelectedAssets = 1
        //        }else{
        configure.singleSelectedMode = true
        //        }
        
        configure.usedCameraButton = false
        
        
        viewController.configure = configure
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
        
    }
    //2.视频转GIF
    func PickVideoToGIF(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        
        
        
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.supportedInterfaceOrientations = [.all]
        configure.mediaType = .video
        configure.numberOfColumn = 3
        //如果是会员在这个进行判断
        configure.singleSelectedMode = true
        configure.usedCameraButton = false
        viewController.configure = configure
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    
    func PickLivephotoToGIF(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
//            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaSubtype == %ld", PHAssetMediaSubtype.photoLive.rawValue)
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        configure.fetchOption = options
        configure.supportedInterfaceOrientations = [.all]
        configure.numberOfColumn = 3
        configure.singleSelectedMode = true
        configure.usedCameraButton = false
        viewController.configure = configure
//        viewController.selectedAssets = self.selectedAssets
        viewController.modalPresentationStyle = .fullScreen
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    
    //3.Gif转视频
    func PickGIFToVideo(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController)  {
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
//            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.fetchCollectionTypes = [(.smartAlbum, .smartAlbumAnimated)]
        configure.numberOfColumn = 3
        configure.singleSelectedMode = true
        configure.supportedInterfaceOrientations = [.all]
        configure.maxSelectedAssets = 1
        //        configure.usedCameraButton = true
        //        configure.allowedVideo = false
//        configure.doneTitle = doneTitle
        viewController.configure = configure
//        viewController.selectedAssets = self.selectedAssets
        viewController.modalPresentationStyle = .fullScreen
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    
    //4.Livephoto转视频
    func PickLivePhotoToVideo(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController,选中的是什么按钮:SelectWhichOne)  {
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
//            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        
        if 选中的是什么按钮 == SelectWhichOne.Live照片转视频{
            //为了获取LivePhoto
            let options = PHFetchOptions()
            options.predicate = NSPredicate(format: "mediaSubtype == %ld", PHAssetMediaSubtype.photoLive.rawValue)
            options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            configure.fetchOption = options
        }
        configure.supportedInterfaceOrientations = [.all]
        configure.numberOfColumn = 3
        
        
        //        if VTLMakerSystemSet.读取是否购买VR360(){
        //            configure.singleSelectedMode = false
        //        }else{
        //            configure.singleSelectedMode = true
        //        }
        configure.singleSelectedMode = true
        configure.usedCameraButton = false
//        configure.doneTitle = doneTitle
        viewController.configure = configure
//        viewController.selectedAssets = self.selectedAssets
        viewController.modalPresentationStyle = .fullScreen
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
    
    //5.Livephoto转LMR
   func PickLivePhotoToLMR(delegate:TLPhotosPickerViewControllerDelegate,numberOfColumn:Int = 3,doneTitle:String = "确认",VC:UIViewController,选中的是什么按钮:SelectWhichOne)  {
        
        let viewController = CustomPhotoPickerViewController(withTLPHAssets: { (assets) in
//            self.selectedAssets = assets
        }, didCancel: nil)
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        //为了获取LivePhoto
        if 选中的是什么按钮 == SelectWhichOne.Live照片转Lmr{
            let options = PHFetchOptions()
            options.predicate = NSPredicate(format: "mediaSubtype == %ld", PHAssetMediaSubtype.photoLive.rawValue)
            options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            configure.fetchOption = options
        }
        configure.supportedInterfaceOrientations = [.all]
        configure.numberOfColumn = 3
        configure.singleSelectedMode = true
        configure.usedCameraButton = false
        viewController.configure = configure
//        configure.doneTitle = doneTitle
//        viewController.selectedAssets = self.selectedAssets
        viewController.modalPresentationStyle = .fullScreen
        //弹出VC
        DispatchQueue.main.async {
            VC.present(viewController, animated: true, completion: nil)
        }
    }
}


