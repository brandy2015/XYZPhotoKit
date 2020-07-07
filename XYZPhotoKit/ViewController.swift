//
//  ViewController.swift
//  XYZPhotoKit
//
//  Created by 张子豪 on 2019/12/16.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import TLPhotoPicker

class ViewController: UIViewController {
    var selectedAssets = [TLPHAsset]()
    
    @IBOutlet weak var imageX: UIImageView!
    @IBAction func 选择照片BTN(_ sender: Any) {
        XYZTLPhotoPicker.添加背景图片Picker(delegate: self, VC: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController:TLPhotosPickerViewControllerDelegate{
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        let phototoshow = withTLPHAssets.first?.fullResolutionImage
        print("运行了哈哈哈")
        imageX.image = phototoshow
    }
    
}
