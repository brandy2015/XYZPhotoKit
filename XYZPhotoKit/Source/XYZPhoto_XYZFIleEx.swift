

//
//  XYZFIleEx.swift
//  XYZPicture
//
//  Created by 张子豪 on 2019/5/2.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZFIleEx: NSObject {

}
public extension Double{
    //    var To2位小数:String  {
    //        return String(format: "%.2f", self)
    //    }
    //    var To2位小数Double:Double? {
    //        return Double(String(format: "%.2f", self))
    //    }
    var To1位小数:String  {
        return String(format: "%.1f", self)
    }
    var To1位小数Double:Double? {
        return Double(String(format: "%.1f", self))
    }
    var DoubleToString:String {
        return "\(self)"
    }
}

public extension UInt64{
    func 文件大小转换Mac() -> (数值:String,单位:String) {
        let filesize = Double("\(self)") ?? 0.0
        
        var sizeX = filesize.s升高一个单位()
        if sizeX < 1.0{
            return (sizeX.To2位小数,"B")
        }else {
            sizeX = sizeX.s升高一个单位()
            if sizeX < 1.0{
                return (sizeX.j降低一个单位().To2位小数,"KB")
            }else {
                sizeX = sizeX.s升高一个单位()
                if sizeX < 1.0{
                    return (sizeX.j降低一个单位().To2位小数,"MB")
                }else {
                    sizeX = sizeX.s升高一个单位()
                    if sizeX < 1.0{
                        return (sizeX.j降低一个单位().To2位小数,"GB")
                    }else {
                        if sizeX < 1.0{
                            return (sizeX.j降低一个单位().To2位小数,"TB")
                        }else{
                            return (filesize.To2位小数,"B")
                        }}}}}}
    
    
    func 文件大小转换Win() -> (数值:String,单位:String) {
        let filesize = Double("\(self)") ?? 0.0
        
        var sizeX = filesize.s升高一个单位(系统是: "Win")
        if sizeX < 1.0{
            return (sizeX.To2位小数,"B")
        }else {
            sizeX = sizeX.s升高一个单位(系统是: "Win")
            if sizeX < 1.0{
                return (sizeX.j降低一个单位(系统是: "Win").To2位小数,"KB")
            }else {
                sizeX = sizeX.s升高一个单位(系统是: "Win")
                if sizeX < 1.0{
                    return (sizeX.j降低一个单位(系统是: "Win").To2位小数,"MB")
                }else {
                    sizeX = sizeX.s升高一个单位(系统是: "Win")
                    if sizeX < 1.0{
                        return (sizeX.j降低一个单位(系统是: "Win").To2位小数,"GB")
                    }else {
                        if sizeX < 1.0{
                            return (sizeX.j降低一个单位(系统是: "Win").To2位小数,"TB")
                        }else{
                            return (filesize.To2位小数,"B")
                        }}}}}}
    
}

public extension Double{
    
    //    1 Byte（B） = 8 bit
    //    1 Kilo Byte（KB） = 1024B
    //    1 Mega Byte（MB） = 1024 KB
    //    1 Giga Byte （GB）= 1024 MB
    //    1 Tera Byte（TB）= 1024 GB
    //    1 Peta Byte（PB） = 1024 TB
    //    1 Exa Byte（EB） = 1024 PB
    //    1 Zetta Byte（ZB） = 1024 EB
    //    1Yotta Byte（YB）= 1024 ZB
    //    1 Bronto Byte（BB） = 1024 YB
    //    1Nona Byte（NB）=1024 BB
    //    1 Dogga Byte（DB）=1024 NB
    //    1 Corydon Byte（CB）=1024DB
    func s升高一个单位(系统是:String = "Mac") -> Double {
        
        if 系统是 == "Mac"{
            return self / 1000.0
        }else{//"Win"
            return self / 1024.0
        }
        
    }
    
    func j降低一个单位(系统是:String = "Mac") -> Double {
        
        if 系统是 == "Mac"{
            return self * 1000.0
        }else{//"Win"
            return self * 1024.0
        }
        
    }
    
}


public extension Double{
    func 取倒数String() -> String {
        if self != 0.0{
            return "1/" + "\(1.0/self)"
        }else{
            return "未知"
        }
    }
    
    
    func 调整曝光时间的格式() -> String {
        if self > 1.0{
            return "\(self)s"
        }else{
            return self.取倒数String() + " s"
        }
    }
        
}



private extension Double{
    var To2位小数:String  {
        return String(format: "%.2f", self)
    }
    var To2位小数Double:Double {
        return Double(String(format: "%.2f", self)) ?? 0.0
    }
//    var To1位小数:String  {
//        return String(format: "%.1f", self)
//    }
//    var To1位小数Double:Double {
//        return Double(String(format: "%.1f", self)) ?? 0.0
//    }
}

private extension String{
    var MB_extension:String{
        return "\(self) MB"
    }
}
