//
//  XYZPhotopicker.swift
//  WoZaiX
//
//  Created by 张子豪 on 2020/4/8.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import JXPhotoBrowser

public extension UIImageView{
    func XYZ_BrowserOpen(With Index:Int = 0) {
        let GestureX  = UITapGestureRecognizer(target: self, action: #selector(self.openPhotoBrowserx(With:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(GestureX)
    }
     
    @objc private func openPhotoBrowserx(With Index:Int = 0)  { 
        let browser = JXPhotoBrowser()
        browser.numberOfItems = {return 1}
        browser.reloadCellAtIndex = { context in
            let browserCell = context.cell as? JXPhotoBrowserImageCell
            browserCell?.imageView.image = self.image
            browserCell?.index = 0
            browserCell?.longPressedAction = { cell, _ in
                self.longPress(cell: cell)
            }
        }
        browser.pageIndex = Index
        browser.show()
    }
    
    
    
    private func longPress(cell: JXPhotoBrowserImageCell) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: { _ in
            
            cell.imageView.image?.SaveToAlbum(completion: { (结果, error) in
                if 结果{
                    print("保存成功") //HUD提示保存成功
                }else{
                    print("保存失败")
                    print(error as Any)
                }
            })
            
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        cell.photoBrowser?.present(alert, animated: true, completion: nil)
    }
}
 
public typealias URLArray = [URL]
public extension URLArray{
    func XYZ_BrowserOpen(With Index:Int = 0) {
        let browser = JXPhotoBrowser()
        browser.numberOfItems = { self.count}
        browser.reloadCellAtIndex = { context in
            let browserCell = context.cell as? JXPhotoBrowserImageCell;
            let indexPath = IndexPath(item: context.index, section: 0)
//            browserCell?.imageView.kf.indicatorType = .activity
//            browserCell?.imageView.kf.setImage(with:  self[indexPath.item])
            
            // 确保 UI 相关操作在主线程上进行
                      DispatchQueue.main.async {
                          // 设置图片加载指示器
                          browserCell?.imageView.kf.indicatorType = .activity
                          
                          // 加载图片
                          browserCell?.imageView.kf.setImage(with: self[indexPath.item])
                      }
            
            browserCell?.index = context.index
            browserCell?.longPressedAction = { cell, _ in
                self.longPress(cell: cell)
            }
        }
        browser.pageIndex = Index // 可指定打开时定位到哪一页
        browser.show()// 展示
    }
    
    private func longPress(cell: JXPhotoBrowserImageCell) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: { _ in
            
            cell.imageView.image?.SaveToAlbum(completion: { (结果, error) in
                if 结果{
                    print("保存成功") //HUD提示保存成功
                }else{
                    print("保存失败")
                    print(error as Any)
                }
            })
            
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        cell.photoBrowser?.present(alert, animated: true, completion: nil)
    }
}

public typealias UIImageArray = [UIImage]
public extension UIImageArray{
    func XYZ_BrowserOpen(With Index:Int = 0) {
        let browser = JXPhotoBrowser()
        browser.numberOfItems = { self.count  }
        browser.reloadCellAtIndex = { context in
            let browserCell = context.cell as? JXPhotoBrowserImageCell;let indexPath = IndexPath(item: context.index, section: 0)
            browserCell?.imageView.image =  self[indexPath.item]
            browserCell?.index = context.index
        }
        browser.pageIndex = Index
        browser.show()
    }
}
