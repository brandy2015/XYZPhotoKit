//
//  JXPhoto_Extension.swift
//  WoZaiX
//
//  Created by 张子豪 on 2019/12/5.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import JXPhotoBrowser 
import Kingfisher
import XYZPathKit
import ObjectiveC

public typealias JXPhotoBrowserImageCell = JXZoomImageCell

public struct JXPhotoBrowserReloadContext {
    public let cell: JXPhotoBrowserAnyCell
    public let index: Int
}

private final class JXPhotoBrowserLegacyDelegate: NSObject, JXPhotoBrowserDelegate {
    var numberOfItemsHandler: (() -> Int)?
    var reloadCellHandler: ((JXPhotoBrowserReloadContext) -> Void)?

    func numberOfItems(in browser: JXPhotoBrowserViewController) -> Int {
        max(0, numberOfItemsHandler?() ?? 0)
    }

    func photoBrowser(_ browser: JXPhotoBrowserViewController, cellForItemAt index: Int, at indexPath: IndexPath) -> JXPhotoBrowserAnyCell {
        browser.dequeueReusableCell(withReuseIdentifier: JXZoomImageCell.reuseIdentifier, for: indexPath)
    }

    func photoBrowser(_ browser: JXPhotoBrowserViewController, willDisplay cell: JXPhotoBrowserAnyCell, at index: Int) {
        if let zoomCell = cell as? JXZoomImageCell {
            zoomCell.index = index
            zoomCell.installLegacyLongPressIfNeeded()
        }
        reloadCellHandler?(JXPhotoBrowserReloadContext(cell: cell, index: index))
    }
}

private enum JXPhotoBrowserLegacyAssociatedKey {
    static var delegate: UInt8 = 0
    static var index: UInt8 = 1
    static var longPressAction: UInt8 = 2
    static var hasLongPress: UInt8 = 3
}

public extension JXPhotoBrowserViewController {
    private var legacyDelegate: JXPhotoBrowserLegacyDelegate {
        if let obj = objc_getAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.delegate) as? JXPhotoBrowserLegacyDelegate {
            return obj
        }
        let obj = JXPhotoBrowserLegacyDelegate()
        objc_setAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.delegate, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return obj
    }

    var numberOfItems: (() -> Int)? {
        get { legacyDelegate.numberOfItemsHandler }
        set {
            let bridge = legacyDelegate
            bridge.numberOfItemsHandler = newValue
            delegate = bridge
        }
    }

    var reloadCellAtIndex: ((JXPhotoBrowserReloadContext) -> Void)? {
        get { legacyDelegate.reloadCellHandler }
        set {
            let bridge = legacyDelegate
            bridge.reloadCellHandler = newValue
            delegate = bridge
        }
    }

    func show() {
        guard let presenter = JXPhotoBrowserLegacyPresenter.topViewController() else { return }
        present(from: presenter)
    }
}

public extension JXZoomImageCell {
    var index: Int {
        get { (objc_getAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.index) as? NSNumber)?.intValue ?? 0 }
        set {
            objc_setAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.index, NSNumber(value: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var photoBrowser: JXPhotoBrowserViewController? {
        browser
    }

    var longPressedAction: ((JXPhotoBrowserImageCell, UILongPressGestureRecognizer) -> Void)? {
        get {
            objc_getAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.longPressAction) as? ((JXPhotoBrowserImageCell, UILongPressGestureRecognizer) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.longPressAction, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            installLegacyLongPressIfNeeded()
        }
    }

    fileprivate func installLegacyLongPressIfNeeded() {
        let hasLongPress = (objc_getAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.hasLongPress) as? NSNumber)?.boolValue ?? false
        guard !hasLongPress else { return }

        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLegacyLongPress(_:)))
        scrollView.addGestureRecognizer(gesture)
        objc_setAssociatedObject(self, &JXPhotoBrowserLegacyAssociatedKey.hasLongPress, NSNumber(value: true), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    @objc private func handleLegacyLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began, let action = longPressedAction else { return }
        action(self, gesture)
    }
}

private enum JXPhotoBrowserLegacyPresenter {
    static func topViewController(base: UIViewController? = rootViewController()) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return topViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }

    private static func rootViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        let activeScene = scenes.first(where: { $0.activationState == .foregroundActive }) ?? scenes.first
        let keyWindow = activeScene?.windows.first(where: \.isKeyWindow) ?? activeScene?.windows.first
        return keyWindow?.rootViewController
    }
}

public extension JXPhotoBrowserViewController{
    static func openPhotoBrowser(index: Int,ImageURLs:[URL]) {
        let browser = JXPhotoBrowserViewController()
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
                JXPhotoBrowserViewController.longPress(cell: cell)
            }
        }
        browser.initialIndex = index
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
