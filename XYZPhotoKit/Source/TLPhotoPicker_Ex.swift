//
//  TLPhotoPicker_Ex.swift
//  XYZPicture
//
//  Created by 张子豪 on 2019/6/2.
//  Copyright © 2019 张子豪. All rights reserved.
//


import UIKit
import Photos
import TLPhotoPicker


//class TLPhotoPicker_Ex: NSObject {
//
//}
//
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
