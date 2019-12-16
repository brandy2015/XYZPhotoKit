//
//  JXPhoto_Extension.swift
//  WoZaiX
//
//  Created by 张子豪 on 2019/12/5.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import JXPhotoBrowser
import SHPathManager
import Kingfisher

public extension JXPhotoBrowser{
    static func openPhotoBrowser(index: Int,ImageURLs:[URL]) {
        let browser = JXPhotoBrowser()
        browser.numberOfItems = {
            ImageURLs.count
        }
        browser.reloadCellAtIndex = { context in
            guard let browserCell = context.cell as? JXPhotoBrowserImageCell else {
                return
            }
            
            
            // 必须从数据源取数据，不能取collectionCell的imageView里的图片，
            // 在更改数据源后即使reloadData，也可能取不到，因为UIImageView的图片需要一个更新周期。
            browserCell.imageView.kf.setImage(with: ImageURLs[context.index])
            browserCell.index = context.index
            // 添加长按事件
            browserCell.longPressedAction = { cell, _ in
                JXPhotoBrowser.longPress(cell: cell)
            }
        }
        browser.pageIndex = index
        browser.show()
    }
    static func longPress(cell: JXPhotoBrowserImageCell) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let ImageInfoAction = UIAlertAction(title: "图片信息", style: .default) { (_) in
            // 图片信息
    //            print("图片：\(String(describing: image))\n长按手势：\(gesture)")
        }
        let ImagesaveAction = UIAlertAction(title: "保存图片", style: .default) { (_) in
            cell.imageView.image?.SaveToAlbum(completion: { (完成, error) in
                print(完成)
                print(error as Any)
                //提示一下保存成功
                
                
            })
        }
        
        actionSheet.addAction(ImagesaveAction)
        actionSheet.addAction(ImageInfoAction)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        cell.photoBrowser?.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
//    static var LongPressDelegate : JXPhotoBrowserBaseDelegate {
//        let delegate = JXPhotoBrowserBaseDelegate()
//        delegate.longPressedCallback = { browser, index, image, gesture in
//
//            JXPhotoBrowser.longPressed(browser: browser, image: image, gesture: gesture)
//
//        }
//        return delegate
//    }
   
    
//    static func longPressed(browser: JXPhotoBrowser, image: UIImage?, gesture: UILongPressGestureRecognizer) {
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let ImageInfoAction = UIAlertAction(title: "图片信息", style: .default) { (_) in
//            // 图片信息
//            print("图片：\(String(describing: image))\n长按手势：\(gesture)")
//        }
//        let ImagesaveAction = UIAlertAction(title: "保存图片", style: .default) { (_) in
//
//            image?.SaveToAlbum(completion: { (完成, error) in
//                print(完成)
//                print(error as Any)
//                //提示一下保存成功
//
//
//            })
//        }
//
//        actionSheet.addAction(ImagesaveAction)
//        actionSheet.addAction(ImageInfoAction)
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//        actionSheet.addAction(cancelAction)
//        browser.present(actionSheet, animated: true, completion: nil)
//    }
//
}
