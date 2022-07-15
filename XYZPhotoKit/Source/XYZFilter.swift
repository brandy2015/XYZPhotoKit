//
//  XYZFilter.swift
//  XYZPhotoKit
//
//  Created by zhangzihao on 2022/7/15.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

//class XYZFilter: NSObject {
//
//   let myImage = UIImage(named: "ListPhoto2")!
//   self.UIImage_Original.image = myImage
//
//
//   guard let currentCGImage = myImage.cgImage else { return }
//   let currentCIImage = CIImage(cgImage: currentCGImage)
//
//   let filter = CIFilter(name: "CIColorMonochrome")
//   filter?.setValue(currentCIImage, forKey: "inputImage")
//
//   // set a gray value for the tint color
//   filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
//
//   filter?.setValue(1.0, forKey: "inputIntensity")
//   guard let outputImage = filter?.outputImage else { return }
//
//   let context = CIContext()
//
//   if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//       let processedImage = UIImage(cgImage: cgimg)
//       print(processedImage.size)
//
//       self.UIImage_After.image = processedImage
//   }
//}
