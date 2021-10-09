//
//  XYZPicExif.swift
//  XYZPicture
//
//  Created by zhangzihao on 2021/10/6.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit

//class XYZPicExif: NSObject {
//
//}





//    XYZPicObject().MakerDict中信息
//    {
//    AspectRatioInfo = 0;
//    CameraTemperatur = 23;
//    ContinuousDrive = 5;
//    FocusDistanceLower = "2.19";
//    FocusDistanceUpper = "655.35";
//    UniqueModelID = 2147484181;
//    WhiteBalanceIndex = 0;
//    }

//    XYZPicObject().tiffDict中信息
//    {

//    Orientation = 1;
//    ResolutionUnit = 2;
//    XResolution = 72;
//    YResolution = 72;
//    }
//    Optio



//
//            return
//    public let kCGImagePropertyExifFNumber: CFString
//

//    public let kCGImagePropertyExifSpectralSensitivity: CFString
//
//            return
//    public let kCGImagePropertyExifISOSpeedRatings: CFString
//









////        print("pixelWidth-宽度")
////        print("\(exif.pixelWidth)")
////        print("pixelHeight-高度")
////        print("\(exif.pixelHeight)")
//////        print("\(exif.area)")
//////        print("\(exif.lensMaker)")
//////        print("\(exif.lensModel)")
//////        print("\(exif.lensSpecification)")
//////        print("\(exif.focalIn35mmFilm)")
////
////
////        print("colorSpace-色彩空间")
////        print("\(exif.colorSpace)")
////        print("whiteBalance-白平衡")
////        print("\(exif.whiteBalance)")
////
//////        print("\(exif.brightness)")
////
////        print("aperture-光圈数")
////        print("\(exif.aperture)")
//
//        print("快门速度")
//
//        print("\(exif.shutterSpeed)")
//
//
//        print("\(exif.isoSpeed)")
//        print("\(exif.sensingMethod)")
//        print("\(exif.focalLength)")
//        print("\(exif.fNumber)")
//        print("\(exif.exposureProgram)")
//        print("\(exif.exposureMode)")
//        print("\(exif.exposureBias)")
//
//
////        print("exposureTime-曝光时间")
////        print("\(exif.exposureTime)")
//        print("\(exif.meteringMode)")
//        print("\(exif.flash)")
//        print("\(exif.flashVersion)")
//
//
//
////        print("dateTimeOriginal-创建日期")
////        print("\(exif.dateTimeOriginal)")
////        print("\(exif.dateTimeDigitized)")
////        print("\(exif.subsecondTimeOriginal)")
////        print("\(exif.subsecondTimeDigitized)")
//
//
//
//        print("\(exif.sceneType)")
//        print("\(exif.sceneCaptureType)")
//        print("\(exif.componentsConfiguration)")
//
//
////        print("exifVersionV-Exif版本")
////        print("\(exif.version)")
//
//
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */











//   XYZPicObject().exifDict中信息

//    ComponentsConfiguration =     (
//    1,
//    2,
//    3,
//    0
//    );
//    CustomRendered = 0;
//    DateTimeDigitized = "2019:04:28 15:49:15";
//    DateTimeOriginal = "2019:04:28 15:49:15";
//    ExifVersion =     (
//    2,
//    2,
//    1
//    );
//    ExposureBiasValue = 0;
//    ExposureMode = 0;
//    ExposureProgram = 3;
//    ExposureTime = "0.002";
//    FNumber = 4;
//    Flash = 0;
//    FlashPixVersion =     (
//    1,
//    0
//    );
//    FocalLength = 16;
//    FocalPlaneResolutionUnit = 2;
//    FocalPlaneXResolution = "3957.716701902748";
//    FocalPlaneYResolution = "3961.904761904762";
//    ISOSpeedRatings =     (
//    100
//    );

//    MeteringMode = 3;

//    SceneCaptureType = 0;
//    ShutterSpeedValue = 9;
//    SubsecTime = 72;
//    SubsecTimeDigitized = 72;
//    SubsecTimeOriginal = 72;
//    WhiteBalance = 0;
//    }



//    ExposureBiasValue = 0;
//    ExposureMode = 0;

//Exif版本
//    ExifVersion =     (
//    2,
//    2,
//    1
//    );

//    闪光灯
//    Flash = 0;
//    FlashPixVersion =     (
//    1,
//    0
//    );





//    init(FileName:String = "00",FileExtension:String = "JPG") {
//        super.init()
//        guard let xURLString = Bundle.main.path(forResource: FileName, ofType: FileExtension) else{
//            print("没有东西")
//            self.FileURLString = nil
//            return
//        }
//        self.FileURLString = xURLString
//        self.FileURL = URL(fileURLWithPath: xURLString)
//        self.imageX = UIImage(contentsOfFile: xURLString)
//    }
    
    
//    init(image:UIImage) {
//
//        self.imageX = image
//    }











////    佳能Canon
//var MakerCanonDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerCanonDictionary]
//}
//
////    尼康nikon
//var MakerNikonDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerNikonDictionary]
//}
////    柯尼卡（KONICA）KONICA MINOLTA
//var MakerMinoltaDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerMinoltaDictionary]
//}
////    Fuji Xerox | 富士施乐
//var MakerFujiDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerFujiDictionary]
//}
////    奥林巴斯olympus
//var MakerOlympusDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerOlympusDictionary]
//}
////    宾得（PENTAX）
//var MakerPentaxDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerPentaxDictionary]
//}
////    Apple
//var MakerAppleDict: AnyObject?{
//    return imageProperties?[kCGImagePropertyMakerAppleDictionary]
//}
//


//    func presentStockVCX()  {
//        let NACcontroller =
//            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "PropertyNAVC") as! UINavigationController
//
//        let PicDetailTVCX = NACcontroller.children.first as! PicDetailTVC
//        let controller = NACcontroller
//        PicDetailTVCX.title = ""
//        let navBar = SPFakeBarView(style: .stork)
//        navBar.titleLabel.text = "照片基本属性"
//        controller.view.addSubview(navBar)
//        let transitionDelegate = SPStorkTransitioningDelegate()
//        transitionDelegate.customHeight = 400
//
//
//        controller.transitioningDelegate = transitionDelegate
//        controller.modalPresentationStyle = .custom
//        controller.modalPresentationCapturesStatusBarAppearance = true
//
//        self.present(NACcontroller, animated: true, completion: nil)
//    }
//
//
//    func presentLarkVCX()  {
//
//        let NAV =
//            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "PropertyNAVC")
//         self.presentAsLark(NAV)
//    }
