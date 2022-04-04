//
//  TLPhotoPicker_Extension.swift
//  WoZaiX
//
//  Created by 张子豪 on 2019/12/9.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import TLPhotoPicker  

public extension UIViewController {
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    //选照片
    func PickPhotoToUpLoad(delegate:TLPhotosPickerViewControllerDelegate,MaxCount:Int = 9) {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.supportedInterfaceOrientations = [.all]
        configure.mediaType          = .image
        configure.numberOfColumn     = 3
        configure.singleSelectedMode = false
        configure.maxSelectedAssets  = MaxCount
        configure.usedCameraButton   = true
        viewController.configure     = configure
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    //2.选择视频
    func PickVideoToUpLoad(delegate:TLPhotosPickerViewControllerDelegate,MaxCount:Int = 1) {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.supportedInterfaceOrientations = [.all]
        configure.mediaType          = .video
        configure.numberOfColumn     = 3
        configure.singleSelectedMode = true
        configure.maxSelectedAssets  = MaxCount
        configure.usedCameraButton   = true
        viewController.configure     = configure
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    //3选照片
    func PickPhotoToUpLoad(delegate:TLPhotosPickerViewControllerDelegate ) {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = delegate
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.supportedInterfaceOrientations = [.all]
        configure.mediaType          = .image
        configure.numberOfColumn     = 3
        configure.singleSelectedMode = true
        configure.usedCameraButton   = true
        viewController.configure     = configure
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
