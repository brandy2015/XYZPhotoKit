
//
//  XYZPicObject.swift
//  testPicker1
//
//  Created by 张子豪 on 2019/4/30.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

import XYZPathKit
import XYZTimeKit
import AVFoundation
//佳能信息在这里
//XYZPicObject().ExifAuxDict
//XYZPicObject().exifDict
//XYZPicObject().tiffDict

public class XYZPicObject:NSObject {  init(FileURLX:URL?) { self.FileURL = FileURLX  }
    var FileURL       : URL? = nil
    var FileName:String     { return Path(FileURLString ?? "").fileName             }
    var FileType:String     { return Path(FileURLString ?? "").pathExtension        }
    var FileURLString : String?  { return FileURL?.path}
    var imageX        : UIImage? { guard let FileURL = self.FileURL else{return nil}
        return UIImage(url: FileURL)
    }
    var ImageXData    :Data?     { guard let FileURL = self.FileURL else{return nil}
        return try? Data(contentsOf: FileURL)
    }
    var imageCFData   :CFData?   { return ImageXData as CFData?}
    var imageSource:CGImageSource?{guard let imageCFData = self.imageCFData else{return nil}
        return CGImageSourceCreateWithData(imageCFData, nil)
    }
    var imageProperties:Dictionary<NSObject, AnyObject>?{
        if let imageSource = imageSource{
            return CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary?
        }else{return nil}
    }
    var GPSDict     : AnyObject?      { return imageProperties?[kCGImagePropertyGPSDictionary]        }
    var XYZPicGPS   : XYZPicGPSObject? {
        guard let GPSDict = GPSDict else{return nil}
        return XYZPicGPSObject(GPSDict: GPSDict)
    }
    var ExifValue   : XYZPicExif      { return XYZPicExif(XYZPicObjectx:self)                         }
     
     
    var FileSize:String{
        guard let 文件大小 = Path(FileURLString ?? "").fileSize?.文件大小转换Mac() else { return "0.0 MB" }
        return 文件大小.0 + 文件大小.1
    }
    
}
 
public class XYZPicExif: NSObject { init(XYZPicObjectx:XYZPicObject) { self.XYZPicObjectX = XYZPicObjectx}
    
    private var XYZPicObjectX   :XYZPicObject!
    private var imageProperties :Dictionary<NSObject, AnyObject>? {  return self.XYZPicObjectX.imageProperties}
//    private var exifDict        :AnyObject?{return XYZPicObjectX.exifDict}
//    private var tiffDict        :AnyObject?{return XYZPicObjectX.tiffDict}
//    private var ExifAuxDict     :AnyObject?{return XYZPicObjectX.ExifAuxDict}
//    private var MakerDict       :AnyObject?{return XYZPicObjectX.MakerDict}
    var tiffDict    : AnyObject?{ return imageProperties?[kCGImagePropertyTIFFDictionary]       }
    var exifDict    : AnyObject?{ return imageProperties?[kCGImagePropertyExifDictionary]       }
    var ExifAuxDict : AnyObject?{ return imageProperties?[kCGImagePropertyExifAuxDictionary]    }
    var RawDict     : AnyObject?{ return imageProperties?[kCGImagePropertyRawDictionary]        }
    
//    var PNGDict         : AnyObject?{  return imageProperties?[kCGImagePropertyPNGDictionary]       }
//    var GIFDict         : AnyObject?{  return imageProperties?[kCGImagePropertyMakerAppleDictionary]}
//    var JFIFDict        : AnyObject?{  return imageProperties?[kCGImagePropertyJFIFDictionary]      }
//    var IPTCDict        : AnyObject?{  return imageProperties?[kCGImagePropertyIPTCDictionary]      }
//    var _8BIMDict       : AnyObject?{  return imageProperties?[kCGImageProperty8BIMDictionary]      }
//    var DNGDict         : AnyObject?{  return imageProperties?[kCGImagePropertyDNGDictionary]       }
//    var OpenEXRDict     : AnyObject?{  return imageProperties?[kCGImagePropertyOpenEXRDictionary]   }
//    var FileContentsDict: AnyObject?{  return imageProperties?[kCGImagePropertyFileContentsDictionary]}
   
    //制造商数据
    var MakerDict: AnyObject?{
        //    佳能Canon
        if let MakerCanonDict = imageProperties?[kCGImagePropertyMakerCanonDictionary]{
            return MakerCanonDict
        }
        
        //    尼康nikon
        if let MakerNikonDict = imageProperties?[kCGImagePropertyMakerNikonDictionary]{
            return MakerNikonDict
        }
        //    柯尼卡（KONICA）KONICA MINOLTA
        if let MakerMinoltaDict = imageProperties?[kCGImagePropertyMakerMinoltaDictionary]{
            return MakerMinoltaDict
        }
        //    Fuji Xerox | 富士施乐
        if let MakerFujiDict = imageProperties?[kCGImagePropertyMakerFujiDictionary]{
            return MakerFujiDict
        }
        //    奥林巴斯olympus
        if let MakerOlympusDict = imageProperties?[kCGImagePropertyMakerOlympusDictionary]{
            return MakerOlympusDict
        }
        //    宾得（PENTAX）
        if let MakerPentaxDict = imageProperties?[kCGImagePropertyMakerPentaxDictionary]{
            return MakerPentaxDict
        }
        //    Apple
        if let MakerAppleDict = imageProperties?[kCGImagePropertyMakerAppleDictionary]{
            return MakerAppleDict
        }
        return nil
        
    }
    
    
    //拍摄时间      2019:04:28 15:49:15";  //DateTime = "2019:04:28 15:49:15";
    var CreationDateString :String{ return (tiffDict?["DateTime"] as? String ) ?? "nil"}
    //    DateTimeDigitized = "2019:04:28 15:49:15"; //    DateTimeOriginal = "2019:04:28 15:49:15";
    var CreationDate:Date{  return CreationDateString.dateFromString() ?? Date()}
    var XYDimension :(X:Int,Y:Int){return ((exifDict?["PixelXDimension"] as? Int) ?? 0,(exifDict?["PixelYDimension"] as? Int) ?? 0)}
    
    //    完整的光圈值系列如下： F1， F1.4， F2， F2.8， F4， F5.6， F8， F11， F16， F22， F32， F44， F64
    // 光圈数f/4
    var ApertureValue :String{
        if let xx = exifDict?[kCGImagePropertyExifApertureValue] as? Double{
            return "F/\(xx)"
        }else{ return "nil"}
    }
    
    //ISO值
    var ISOSpeedRatings :String{
        if let x = (exifDict?["ISOSpeedRatings"] as? NSArray)?.firstObject as? Double{ return "\(x)" }else{ return "nil"}
    }
    //    焦距
    var FocalLength :String{
        if let x = exifDict?["FocalLength"] as? Double { return "\(x)" + "mm" }else{ return "nil"}
    }
    
    //曝光补偿值
    var ExposureBiasValue:String{
        if let x = exifDict?["ExposureBiasValue"] as? Double { return "\(x)" }else{ return "nil"}
    }
    //曝光时间
    var ExposureTime :String{
        if let xx = exifDict?[kCGImagePropertyExifExposureTime] as? Double{ return xx.调整曝光时间的格式() }else{ return "未知曝光时间"}
    }
    //曝光程序
    var ExposureProgram :String{
        if let xx = exifDict?[kCGImagePropertyExifExposureProgram] as? Double{
            if xx == 3.0 { return "光圈优先" }else{return "未知"}
        }else{ return "nil"}
    }
     
    var useFlash:String{
        if let xx = exifDict?["Flash" as CFString] as? Int {
            if xx == 0 { return "未使用闪光灯" }else{ return "使用闪光灯"  }
        }else{ return "未知"}
    }
    
    var FlashPixVersion:String{
        if let x = exifDict?["FlashPixVersion" as CFString] as? NSArray {
            return x.componentsJoined(by: ".")
        }else{ return "未知"}
    }
    //    颜色描述文件
    var ColorSpaceDiscription :String{
        if let x = imageProperties?["ProfileName" as CFString] as? String { return x }else{ return "nil"}
    }
    //    颜色空间 //    ColorSpace  RGB
    var ColorSpace :String{
        if let x = imageProperties?["ColorModel" as CFString] as? String { return x }else{ return "nil"}
    }
    //未使用!!!!!!未被开发//    白平衡//需要改造
    var WhiteBalance:String?{
        if let x = exifDict?["WhiteBalance"] as? Int{ if x == 0{ return "未知"}else{ return "未知"} }else{ return nil}
    }
    //    Z测光模式
    var MeteringMode :String?{
        if let x = exifDict?["MeteringMode"] as? Int{
            if x == 3{return "点测光"}else{  return "未知"}
        }else{ return nil}
    }
     
    //    Z红眼
    //    Alpha 通道
      
    //    图片旋转与否
    var Orientation       :Int?   { return imageProperties?["Orientation" as CFString] as? Int }
    //    对焦模式FocusMode//！！！！需要改造
    var FocusMode         :String?{ return "\(ExifAuxDict?["FocusMode"]  as? Double ?? 0.0)" }
    //    摄像机制造商 //    Maker = Canon;
    var CameraMaker       :String{  return (tiffDict?["Make"]            as? String ) ?? "nil"}
    //摄像机型号      //    Model = "Canon EOS-1Ds Mark III";
    var CameraModel       :String{  return (tiffDict?["Model"]           as? String) ?? "nil"}
    //    摄像头制造商与摄像头型号 "Canon EF 16-35mm f/2.8L II USM"
    var LensModelandMaker :String{  return (ExifAuxDict?["LensModel"]    as? String) ?? "nil"}
    //    光圈范围
    var MaxMinAperture :(Max:Double,Min:Double){
        return ((MakerDict?["MaxAperture"] as? Double) ?? 0.0,(MakerDict?["MinAperture"] as? Double) ?? 0.0)}
    //    焦距范围
    var FocusDistance :(Upper:Double,Lower:Double){
        return ((MakerDict?["FocusDistanceUpper"] as? Double) ?? 0.0,(MakerDict?["FocusDistanceLower"] as? Double) ?? 0.0)}
     
}

import CoreLocation

public class XYZPicGPSObject: NSObject {
    public var GPSDict: AnyObject? = nil
    
    init(GPSDict:AnyObject?) {  self.GPSDict = GPSDict}
    
    var Altitude          : Double{  return (GPSDict?["Altitude"]          as? Double) ?? 0.0}
    var AltitudeRef       : Double{  return (GPSDict?["AltitudeRef"]       as? Double) ?? 0.0}
    var DateStamp         : String{  return (GPSDict?["DateStamp"]         as? String) ?? ""}
    var DestBearing       : Double{  return (GPSDict?["DestBearing"]       as? Double) ?? 0.0}
    var DestBearingRef    : String{  return (GPSDict?["DestBearingRef"]    as? String) ?? "" }
    var HPositioningError : Double{  return (GPSDict?["HPositioningError"] as? Double) ?? 0.0}
    var ImgDirection      : Double{  return (GPSDict?["ImgDirection"]      as? Double) ?? 0.0}
    var ImgDirectionRef   : String{  return (GPSDict?["ImgDirectionRef"]   as? String) ?? ""}
    var Latitude          : Double{  return (GPSDict?["Latitude"]          as? Double) ?? 0.0}
    var LatitudeRef       : String{  return (GPSDict?["LatitudeRef"]       as? String) ?? ""}
    var Longitude         : Double{  return (GPSDict?["Longitude"]         as? Double) ?? 0.0}
    var LongitudeRef      : String{  return (GPSDict?["LongitudeRef"]      as? String) ?? ""}
    var Speed             : Double{  return (GPSDict?["Speed"]             as? Double) ?? 0.0}
    var SpeedRef          : String{  return (GPSDict?["SpeedRef"]          as? String) ?? ""}
    var TimeStamp         : String{  return (GPSDict?["TimeStamp"]         as? String) ?? ""}
    var TimeStampDate     : Date  {  return TimeStamp.dateFromString()    ?? Date()             }
    var creationDateString:String {  return DateStamp + " " + TimeStamp}
    
    var GPSPoint:CLLocation? { 
        return CLLocation(coordinate: CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude), altitude: Altitude, horizontalAccuracy: 0, verticalAccuracy: 0, course: ImgDirection, speed: Speed, timestamp: TimeStampDate)
    }
}



import Foundation

private extension String {
    func stringArray() -> [String]? {
        guard self.count > 2 else {
            return nil
        }
        
        let parenthesesDeletedText = String(self.prefix(self.count - 1)).suffix(self.count - 2)
        let separated = parenthesesDeletedText.components(separatedBy: ",")
        return separated.map{ $0.trimmingCharacters(in: .whitespaces) }
    }
    
    func isNotHyphen() -> String? {
        return self == "-" ? nil : self
    }
    
    func dateFromString() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return formatter.date(from: self)
    }
}
