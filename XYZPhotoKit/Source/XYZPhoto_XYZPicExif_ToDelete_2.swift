//
//  xxxxpppp.swift
//  XYZPicture
//
//  Created by zhangzihao on 2021/10/6.
//  Copyright © 2021 张子豪. All rights reserved.
//

import Foundation


//    func exifxxx(){
//        var image = info[UIImagePickerControllerOriginalImage] as! UIImage
//         let jpeg = UIImageJPEGRepresentation(image, 1.0)
//         var source: CGImageSource? = nil
//         source = CGImageSourceCreateWithData((jpeg as CFData?)!, nil)
//         let metadata = CGImageSourceCopyPropertiesAtIndex(source!, 0, nil) as? [AnyHashable: Any]
//         var metadataAsMutable = metadata
//         var EXIFDictionary = (metadataAsMutable?[(kCGImagePropertyExifDictionary as String)]) as? [AnyHashable: Any]
//         var GPSDictionary = (metadataAsMutable?[(kCGImagePropertyGPSDictionary as String)]) as? [AnyHashable: Any]
//
//         if !(EXIFDictionary != nil) {
//               EXIFDictionary = [AnyHashable: Any]()
//            }
//          if !(GPSDictionary != nil) {
//               GPSDictionary = [AnyHashable: Any]()
//           }
//
//           GPSDictionary![(kCGImagePropertyGPSLatitude as String)] = 30.21313
//           GPSDictionary![(kCGImagePropertyGPSLongitude as String)] = 76.22346
//           EXIFDictionary![(kCGImagePropertyExifUserComment as String)] = "Hello Image"
//
//           let UTI: CFString = CGImageSourceGetType(source!)!
//           let dest_data = NSMutableData()
//           let destination: CGImageDestination = CGImageDestinationCreateWithData(dest_data as CFMutableData, UTI, 1, nil)!
//           CGImageDestinationAddImageFromSource(destination, source!, 0, (metadataAsMutable as CFDictionary?))
//                    CGImageDestinationFinalize(destination)
//    }


//    func writeMetaData(imageData: CFData) -> Data? {
//        let options = [kCGImageSourceShouldCache : kCFBooleanTrue]
//
//        if let imgSrc = CGImageSourceCreateWithData(imageData as CFData, options as CFDictionary) {
//
////            let metadatacc = CFDictionaryCreateMutableCopy(nil, 0,CGImageSourceCopyPropertiesAtIndex(imgSrc, 0, options as CFDictionary)) as NSMutableDictionary
////            let exifdata = metadatacc.value(forKey: kCGImagePropertyExifDictionary as String) as! NSMutableDictionary
//
//            print("🐒")
//            print(exifdata)
////            exifdata.setValue("yaw:\(attitudes.0), pitch:\(attitudes.1), roll:\(attitudes.2)", forKey: kCGImagePropertyExifUserComment as String)
//            metadatacc.setValue(exifdata, forKey: kCGImagePropertyExifDictionary as String)
////            guard let uniformTypeIdentifier = CGImageSourceGetType(imgSrc) else { return nil }
////            let finalData = NSMutableData()
//////            guard let destination = CGImageDestinationCreateWithData((finalData as CFMutableData), uniformTypeIdentifier, 1, nil) else { return nil}
////
////
////
////            let source                  =   CGImageSourceCreateWithData(imageData, nil)
//
//
//
////                let destinationx             =   getDestination(finalData:finalData, source:source!)
////            print(destinationx)
//
////            CGImageDestinationAddImageFromSource(destination, imgSrc, 0, metadatacc)
//
//
////            let x = userDocument + "yes.jpg"
//
//
////            imgSrc.writeToURL(x.url) { xx, yy in
////                print(xx)
////                print(yy)
////            }
////            let x = UIImage(data: imageData as Data)
////            x?.SaveToAlbum(completion: { isSuccess, error in
////
////            })
//
//
//            PHPhotoLibrary.shared().performChanges({
//                guard let x = UIImage(data: imageData as Data) else{return }
//                let datxxx = PHAssetChangeRequest.creationRequestForAsset(from: x)
//
//                let datex =  XYZPicObject.share?.ExifValue.CreationDateString
//                print(datex)
//
//                let datexxx = datex?.dateFromString()
//                print(datexxx )
//                datxxx.creationDate = datexxx
//
//            }) { (isSuccess: Bool, error: Error?) in
//
//                if isSuccess { print("保存成功")
//                } else{ print("保存失败：", error!.localizedDescription)}
//            }
//
//
//
////            guard CGImageDestinationFinalize(destination), finalData.count > 0 else { return nil }
//            return finalData as Data
//
//        }
//        return nil
//
//    }


//    extension CGImage {
//        var png: Data? {
//            guard let mutableData = CFDataCreateMutable(nil, 0),
//                let destination = CGImageDestinationCreateWithData(mutableData, "public.png" as CFString, 1, nil) else { return nil }
//            CGImageDestinationAddImage(destination, self, nil)
//            guard CGImageDestinationFinalize(destination) else { return nil }
//            return mutableData as Data
//        }
//    }



//    extension UIImage {
//
//        func getExifData() -> CFDictionary? {
//            var exifData: CFDictionary? = nil
//            if let data = self.jpegData(compressionQuality: 1.0) {
//                data.withUnsafeBytes {
//                    let bytes = $0.baseAddress?.assumingMemoryBound(to: UInt8.self)
//                    if let cfData = CFDataCreate(kCFAllocatorDefault, bytes, data.count),
//                        let source = CGImageSourceCreateWithData(cfData, nil) {
//                        exifData = CGImageSourceCopyPropertiesAtIndex(source, 0, nil)
//                    }
//                }
//            }
//            return exifData
//        }
//    }

//fileprivate func getDestination(finalData:CFMutableData, source:CGImageSource)->CGImageDestination?{
//    guard let destination = CGImageDestinationCreateWithData(finalData,
//                                                             CGImageSourceGetType(source)!,
//                                                             1,
//                                                             nil)else{return nil}
//    return destination
//}
//func GetExif(){
////        import ImageIO
////
////        let fileURL = theURLToTheImageFile
////        if let imageSource = CGImageSourceCreateWithURL(fileURL as CFURL, nil) {
////            let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)
////            if let dict = imageProperties as? [String: Any] {
////                print(dict)
////            }
////        }
//}

//        PHPhotoLibrary.shared().performChanges({
//
////            let yxl = XYZPicObject.share?.ImageXData
//
////            do {
////                try yxl?.write(to: userDocument + "yes.jpg")
////            }catch{
////                print(error)
////            }
//
//            let datex =  XYZPicObject.share?.ExifValue.CreationDate ?? Date()
//            let ImagePHACRRequest = PHAssetChangeRequest.creationRequestForAsset(from: XYZPicObject.share?.imageX ?? UIImage())
//            ImagePHACRRequest.creationDate = datex
//
//
//
//
//
//        }) { (isSuccess: Bool, error: Error?) in
//
//            if isSuccess { print("保存成功")
//            } else{ print("保存失败：", error!.localizedDescription)}
//        }

//        let ImagePHACRRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: urlString)
//        ImagePHACRRequest?.creationDate = CreationDate
