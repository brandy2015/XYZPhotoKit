//
//  XYZPHAsset.swift
//  XYZManager
//
//  Created by 张子豪 on 2019/2/11.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import Photos
import TLPhotoPicker

public class XYZPHAsset: NSObject {

}

//
//public extension TLPHAsset{
//
//    static func ToPHAssets(TLPHAssets:[TLPHAsset]) -> [PHAsset]? {
//
//        var phAssetXs = [PHAsset]()
//        for i in TLPHAssets{
//            if let x = i.phAsset{
//                phAssetXs.append(x)
//            }
//        }
//        return phAssetXs
//    }
//
//    static func deleteAllOriginals(TLPHAssets:[TLPHAsset],Succeeded: @escaping ()->Void,Failed: @escaping ()->Void)  {
//
//        guard let phAssetXs = TLPHAsset.ToPHAssets(TLPHAssets: TLPHAssets) else{
//            print("TLPHAssets To PHAssets Failed")
//            return
//        }
//        PHAsset.deletePHAssets(videosPHAssets: phAssetXs, Succeeded: {
//            print("删除成功")
//            Succeeded()
//
//        }) {
//            Failed()
//            print("删除失败")
//        }
//    }
//}
//
//public extension PHAsset {
//
//    static func deletePHAssets(videosPHAssets:[PHAsset],Succeeded: @escaping ()->Void,Failed: @escaping ()->Void)  {
//        PHPhotoLibrary.shared().performChanges({
//            if videosPHAssets.count != 0 {
//                PHAssetChangeRequest.deleteAssets(videosPHAssets as NSFastEnumeration)
//            }
//        }) { (succeed, error) in
//            if succeed{Succeeded()}else{
//                Failed()
//                print(error as Any)
//            }
//        }
//    }
//
//    func getURL(completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
//        if self.mediaType == .image {
//            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
//            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
//                return true
//            }
//            self.requestContentEditingInput(with: options, completionHandler: {(contentEditingInput: PHContentEditingInput?, info: [AnyHashable : Any]) -> Void in
//                completionHandler(contentEditingInput!.fullSizeImageURL as URL?)
//            })
//        } else if self.mediaType == .video {
//            let options: PHVideoRequestOptions = PHVideoRequestOptions()
//            options.version = .original
//            PHImageManager.default().requestAVAsset(forVideo: self, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) -> Void in
//                if let urlAsset = asset as? AVURLAsset {
//                    let localVideoUrl: URL = urlAsset.url as URL
//                    completionHandler(localVideoUrl)
//                } else {
//                    completionHandler(nil)
//                }
//            })
//        }
//    }
//}


public extension TLPHAsset{

    static func ToPHAssets(TLPHAssets:[TLPHAsset]) -> [PHAsset] {
        return TLPHAssets.compactMap{$0.phAsset}
    }
    
    static func deleteAllOriginals(TLPHAssets:[TLPHAsset],Succeeded: @escaping ()->Void,Failed: @escaping ()->Void)  {
        let videosPHAssets = TLPHAsset.ToPHAssets(TLPHAssets: TLPHAssets)
        PHAsset.deletePHAssets(videosPHAssets: videosPHAssets, Succeeded: {
            Succeeded();print("删除成功")
        }) {Failed();print("删除失败")}
    }
}

public extension PHAsset {
    
      static func deletePHAssets(videosPHAssets:[PHAsset],Succeeded: @escaping ()->Void,Failed: @escaping ()->Void)  {
        PHPhotoLibrary.shared().performChanges({
            if videosPHAssets.count != 0 {
                PHAssetChangeRequest.deleteAssets(videosPHAssets as NSFastEnumeration)
            }
        }) { (succeed, error) in
            if succeed{Succeeded()}else{
                Failed()
                print(error as Any)
            }
        }
    }
    
     func getURL(completionHandler : @escaping ((_ responseURL : URL?) -> Void)){
        if self.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            self.requestContentEditingInput(with: options, completionHandler: {(contentEditingInput: PHContentEditingInput?, info: [AnyHashable : Any]) -> Void in
                completionHandler(contentEditingInput!.fullSizeImageURL as URL?)
            })
        } else if self.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: self, options: options, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable : Any]?) -> Void in
                if let urlAsset = asset as? AVURLAsset {
                    let localVideoUrl: URL = urlAsset.url as URL
                    completionHandler(localVideoUrl)
                } else {
                    completionHandler(nil)
                }
            })
        }
    }
}
