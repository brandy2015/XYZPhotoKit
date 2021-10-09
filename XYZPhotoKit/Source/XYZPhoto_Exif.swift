//
//  XYZPhoto_Exif.swift
//  XYZPhotoKit
//
//  Created by zhangzihao on 2021/10/9.
//  Copyright © 2021 张子豪. All rights reserved.
//
import UIKit
import MobileCoreServices            //picker.mediaTypes的类型
import Photos
import TLPhotoPicker
import XYZPathKit
import XYZTimeKit 


public extension URL{
   
   var ExifDate:Date{
       let CreationDate = XYZPicObject(FileURLX: self).ExifValue.CreationDate
       return CreationDate
   }
   func PutExifDateToFileDate(){
       try? FileManager.default.setAttributes([FileAttributeKey.creationDate: self.ExifDate,FileAttributeKey.modificationDate: self.ExifDate], ofItemAtPath: self.path)
   }
   
   func SavePhotoToSysAlbum(completion: @escaping (_ isSuccess: Bool, _ error: Error?) -> Void)  {
       PHPhotoLibrary.shared().performChanges({
           let ImagePHACRRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: self)
           ImagePHACRRequest?.creationDate = self.ExifDate
       }) { (isSuccess: Bool, error: Error?) in
           
           if isSuccess {
               print("保存成功")
               
           } else{ print("保存失败：", error!.localizedDescription)}
           completion(isSuccess,error)
       }
   }
   
}
