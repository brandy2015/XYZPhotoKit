//
//  CustomPhotoPickerViewController.swift
//  TLPhotoPicker
//
//  Created by wade.hawk on 2017. 5. 28..
//  Copyright © 2017년 CocoaPods. All rights reserved.
//

import Foundation
import TLPhotoPicker

public class CustomPhotoPickerViewController: TLPhotosPickerViewController {
    
    public override var selectedAssets: [TLPHAsset] {
        willSet {
            self.doneButton?.isEnabled = newValue.count > 0
        }
    }


    
  
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.view.backgroundColor = .black
        self.collectionView.backgroundColor = .black
//        if #available(iOS 13.0, *) {
//            let userInterfaceStyle = self.traitCollection.userInterfaceStyle
//            let image = TLBundle.podBundleImage(named: "pop_arrow")
//            if userInterfaceStyle.rawValue == 2 {
//                self.popArrowImageView.image = image?.colorMask(color: .black)//.systemBackground)
//                self.view.backgroundColor = .black
//                self.collectionView.backgroundColor = .black
//            }else {
//                self.popArrowImageView.image = image?.colorMask(color: .white)
//                self.view.backgroundColor = .white
//                self.collectionView.backgroundColor = .white
//            }
//        }
    }
    
    public override func makeUI() {
        super.makeUI()
        
        var 暗黑模式 = false
        暗黑模式 = true
        if 暗黑模式{

        
            self.view.backgroundColor = .black
            self.navigationBar.barStyle = .black
            self.navigationBar.backgroundColor = .black
            
                self.customNavItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .stop, target: nil, action: #selector(customAction))
                self.view.backgroundColor = UIColor.black
                self.collectionView.backgroundColor = UIColor.black
                self.navigationBar.barStyle = .black
                self.titleLabel.textColor = .white
                self.subTitleLabel.textColor = .white
                self.navigationBar.tintColor = .white
            
            self.view.backgroundColor = .black
            self.collectionView.backgroundColor = .black
            
            //让背景变黑重要的执行
            self.albumPopView.popupView.backgroundColor = .black
            self.albumPopView.tableView.backgroundColor = .black
        }
        
        self.doneButton?.isEnabled = false
    }
    
    @objc func customAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
