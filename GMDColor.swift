//
//  GMDColor.swift
//  GMDColorDemo
//
//  Created by liuyubobobo on 7/17/16.
//  Copyright © 2016 Yubo Liu. All rights reserved.
//

import UIKit

// MARK: - enum GMDColorType
/// The enum of Google Material Design Color Type.
///
/// Currently, there are **21** colors in total.
///
/// They are: Red, Pink, Purple, DeepPurple, Indigo, Blue, LightBlue, Cyan, Teal, Green, LightGreen, Lime, Yellow, Amber, Orange, DeepOrange, Brown, Grey, BlueGrey, Black and White.
public enum GMDColorType: Int{
    case Red, Pink, Purple, DeepPurple, Indigo, Blue, LightBlue, Cyan, Teal, Green, LightGreen, Lime, Yellow, Amber, Orange, DeepOrange, Brown, Grey, BlueGrey, Black, White;
    
    /// The total number of Google Material Design Color Type.
    /// Currently, there are 21 colors in total.
    static var count: Int{
        return GMDColorType.White.rawValue + 1
    }
    
    private static var accentCount: Int{
        return GMDColorType.DeepOrange.rawValue + 1
    }
    
    /// Name of the Google Material Design Color Type
    var name: String{
        switch self{
        case .Red:          return "Red"
        case .Pink:         return "Pink"
        case .Purple:       return "Purple"
        case .DeepPurple:   return "Deep Purple"
        case .Indigo:       return "Indigo"
        case .Blue:         return "Blue"
        case .LightBlue:    return "Light Blue"
        case .Cyan:         return "Cyan"
        case .Teal:         return "Teal"
        case .Green:        return "Green"
        case .LightGreen:   return "Light Green"
        case .Lime:         return "Lime"
        case .Yellow:       return "Yellow"
        case .Amber:        return "Amber"
        case .Orange:       return "Orange"
        case .DeepOrange:   return "Deep Orange"
        case .Brown:        return "Brown"
        case .Grey:         return "Grey"
        case .BlueGrey:     return "Blue Grey"
        case .Black:        return "Black"
        case .White:        return "White"
        }
    }
    
    /// The Primary Color Count of the Google Material Design Color Type
    var primaryLevelCount: Int{
        switch self{
        case .Black, .White:
            return 1
        default:
            return GMDColorPrimaryLevel.count
        }
    }
    
    /// TheAccent Color Count of the Google Material Design Color Type
    var accentLevelCount: Int{
        if self.rawValue < GMDColorType.accentCount{
            return GMDColorAccentLevel.count
        }
        else{
            return 0
        }
    }
}

// MARK: - enum GMDColorPrimaryLevel
/// The enum of GMD Primary Color Level.
///
/// Currently, there are **10** different primary color levels for each color type except black and white, which have just one primary color level.
///
/// They are: P50, P100, P200, P300, P400, P500, P600, P700, P800, P900.
///
/// The **Default** primary color level is equal to **P500**.
public enum GMDColorPrimaryLevel: Int{
    case Default, P50, P100, P200, P300, P400, P500, P600, P700, P800, P900;
    
    /// The total number of Google Material Design Primary Color Level.
    ///
    /// Currently, there are **11** levels in total, which are **10** different primary color levels plus **Default** color level, which equal to **P500**.
    static var count: Int{
        return GMDColorPrimaryLevel.P900.rawValue + 1
    }
    
    /// Name of the Google Material Design Primary Color Level.
    var name: String{
        switch self{
        case .Default:  return "Default"
        case .P50:      return "P50"
        case .P100:     return "P100"
        case .P200:     return "P200"
        case .P300:     return "P300"
        case .P400:     return "P400"
        case .P500:     return "P500"
        case .P600:     return "P600"
        case .P700:     return "P700"
        case .P800:     return "P800"
        case .P900:     return "P900"
        }
    }
}

// MARK: - enum GMDColorAccentLevel
/// The enum of GMD Accent Color Level.
///
/// Currently, there are **4** different primary color levels for each color type except brown, grey, blue grey, black and white, which have no accent color.
///
/// They are: A100, A200, A400, A700.
public enum GMDColorAccentLevel: Int{
    case A100, A200, A400, A700;
    
    /// The total number of Google Material Design Accent Color Level.
    ///
    /// Currently, there are **4** levels in total.
    static var count: Int{
        return GMDColorAccentLevel.A700.rawValue + 1
    }
    
    /// Name of the Google Material Design Accent Color Level.
    var name: String{
        switch self{
        case .A100: return "A100"
        case .A200: return "A200"
        case .A400: return "A400"
        case .A700: return "A700"
        }
    }
}

// MARK: - extension UIColor
public extension UIColor{
    
    public convenience init(colorHex: UInt){
        
        let r: CGFloat = CGFloat((colorHex & 0xFF0000)>>16)/255.0
        let g: CGFloat = CGFloat((colorHex & 0x00FF00)>>8)/255.0
        let b: CGFloat = CGFloat((colorHex & 0x0000FF)>>0)/255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    public var hex: String{
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let uintR: UInt = UInt( r * 255.0 + 0.5 )
        let uintG: UInt = UInt( g * 255.0 + 0.5 )
        let uintB: UInt = UInt( b * 255.0 + 0.5 )
        return String(format: "%06X", uintR<<16 + uintG<<8 + uintB)
    }
}

// MARK: - struct GMD
// **GMD** is short for **Google Material Design**
public struct GMD{
    
    /// Get a **Primary Color** given the GMDColorType and GMDColorPrimaryLevel
    /// - Returns: The UIColor presents the GMD Primary Color
    public static func primaryColor(colorType: GMDColorType, level: GMDColorPrimaryLevel) -> UIColor{
    
        let colorHex: UInt = getPrimaryColorData(colorType, level: level.rawValue)
        
        return UIColor(colorHex: colorHex)
    }
    
    /// Get an **Accent Color** given the GMDColorType and GMDColorAccentLevel
    /// - Returns: The UIColor presents the GMD Accent Color
    public static func accentColor(colorType: GMDColorType, level: GMDColorAccentLevel) -> UIColor?{
        
        guard let colorHex: UInt = getAccentColorData(colorType, level: level.rawValue) else {
            return nil
        }
        
        return UIColor(colorHex: colorHex)
    }
    
    /// Get the best text color on a GMD primary color given GMDColorType and GMDColorPrimaryLevel
    ///
    /// That's either the darkTextColor or the lightTextColor
    /// - Returns: The UIColor presents the text color
    public static func textColor(colorType: GMDColorType, level: GMDColorPrimaryLevel) -> UIColor{
    
        let index: Int = level == .Default ? GMDColorPrimaryLevel.P500.rawValue : level.rawValue
        
        return index < GMD.primaryWhiteTextColorBound(colorType) ? GMD.darkTextColor : GMD.lightTextColor
    }
    
    /// Get the best text color on a GMD accent color given GMDColorType and GMDColorAccentLevel
    ///
    /// That's either the darkTextColor or the lightTextColor
    /// - Returns: The UIColor presents the text color
    public static func textColor(colorType: GMDColorType, level: GMDColorAccentLevel) -> UIColor?{
        
        if level.rawValue < GMDColorType.accentCount{
            return level.rawValue < GMD.accentWhiteTextColorBound(colorType) ? GMD.darkTextColor : GMD.lightTextColor
        }
        
        return nil
        
    }
    
    /// The dark text color on GMD background color
    ///
    /// The default value is **#212121**
    public static var darkTextColor: UIColor = UIColor(colorHex: 0x212121)
    /// The light text color on GMD background color
    ///
    /// The default value is **#ffffff**
    public static var lightTextColor: UIColor = UIColor.whiteColor()
    
    // MARK: - private methods
    private static func getPrimaryColorData(colorType: GMDColorType, level: Int) -> UInt{
        
        switch colorType{
        case .Red:
            let red:[UInt] = [0xF44336,0xFFEBEE,0xFFCDD2,0xEF9A9A,0xE57373,0xEF5350,0xF44336,0xE53935,0xD32F2F,0xC62828,0xB71C1C]
            assert(red.count == GMDColorPrimaryLevel.count)
            return red[level]
        case .Pink:
            let pink:[UInt] = [0xE91E63,0xFCE4EC,0xF8BBD0,0xF48FB1,0xF06292,0xEC407A,0xE91E63,0xD81B60,0xC2185B,0xAD1457,0x880E4F]
            assert(pink.count == GMDColorPrimaryLevel.count)
            return pink[level]
        case .Purple:
            let purple:[UInt] = [0x9C27B0,0xF3E5F5,0xE1BEE7,0xCE93D8,0xBA68C8,0xAB47BC,0x9C27B0,0x8E24AA,0x7B1FA2,0x6A1B9A,0x4A148C]
            assert(purple.count == GMDColorPrimaryLevel.count)
            return purple[level]
        case .DeepPurple:
            let deepPurple:[UInt] = [0x673AB7,0xEDE7F6,0xD1C4E9,0xB39DDB,0x9575CD,0x7E57C2,0x673AB7,0x5E35B1,0x512DA8,0x4527A0,0x311B92]
            assert(deepPurple.count == GMDColorPrimaryLevel.count)
            return deepPurple[level]
        case .Indigo:
            let indigo:[UInt] = [0x3F51B5,0xE8EAF6,0xC5CAE9,0x9FA8DA,0x7986CB,0x5C6BC0,0x3F51B5,0x3949AB,0x303F9F,0x283593,0x1A237E]
            assert(indigo.count == GMDColorPrimaryLevel.count)
            return indigo[level]
        case .Blue:
            let blue:[UInt] = [0x2196F3,0xE3F2FD,0xBBDEFB,0x90CAF9,0x64B5F6,0x42A5F5,0x2196F3,0x1E88E5,0x1976D2,0x1565C0,0x0D47A1]
            assert(blue.count == GMDColorPrimaryLevel.count)
            return blue[level]
        case .LightBlue:
            let lightBlue:[UInt] = [0x03A9F4,0xE1F5FE,0xB3E5FC,0x81D4FA,0x4FC3F7,0x29B6F6,0x03A9F4,0x039BE5,0x0288D1,0x0277BD,0x01579B]
            assert(lightBlue.count == GMDColorPrimaryLevel.count)
            return lightBlue[level]
        case .Cyan:
            let cyan:[UInt] = [0x00BCD4,0xE0F7FA,0xB2EBF2,0x80DEEA,0x4DD0E1,0x26C6DA,0x00BCD4,0x00ACC1,0x0097A7,0x00838F,0x006064]
            assert(cyan.count == GMDColorPrimaryLevel.count)
            return cyan[level]
        case .Teal:
            let teal:[UInt] = [0x009688,0xE0F2F1,0xB2DFDB,0x80CBC4,0x4DB6AC,0x26A69A,0x009688,0x00897B,0x00796B,0x00695C,0x004D40]
            assert(teal.count == GMDColorPrimaryLevel.count)
            return teal[level]
        case .Green:
            let green:[UInt] = [0x4CAF50,0xE8F5E9,0xC8E6C9,0xA5D6A7,0x81C784,0x66BB6A,0x4CAF50,0x43A047,0x388E3C,0x2E7D32,0x1B5E20]
            assert(green.count == GMDColorPrimaryLevel.count)
            return green[level]
        case .LightGreen:
            let lightGreen:[UInt] = [0x8BC34A,0xF1F8E9,0xDCEDC8,0xC5E1A5,0xAED581,0x9CCC65,0x8BC34A,0x7CB342,0x689F38,0x558B2F,0x33691E]
            assert(lightGreen.count == GMDColorPrimaryLevel.count)
            return lightGreen[level]
        case .Lime:
            let lime:[UInt] = [0xCDDC39,0xF9FBE7,0xF0F4C3,0xE6EE9C,0xDCE775,0xD4E157,0xCDDC39,0xC0CA33,0xAFB42B,0x9E9D24,0x827717]
            assert(lime.count == GMDColorPrimaryLevel.count)
            return lime[level]
        case .Yellow:
            let yellow:[UInt] = [0xFFEB3B,0xFFFDE7,0xFFF9C4,0xFFF59D,0xFFF176,0xFFEE58,0xFFEB3B,0xFDD835,0xFBC02D,0xF9A825,0xF57F17]
            assert(yellow.count == GMDColorPrimaryLevel.count)
            return yellow[level]
        case .Amber:
            let amber:[UInt] = [0xFFC107,0xFFF8E1,0xFFECB3,0xFFE082,0xFFD54F,0xFFCA28,0xFFC107,0xFFB300,0xFFA000,0xFF8F00,0xFF6F00]
            assert(amber.count == GMDColorPrimaryLevel.count)
            return amber[level]
        case .Orange:
            let orange:[UInt] = [0xFF9800,0xFFF3E0,0xFFE0B2,0xFFCC80,0xFFB74D,0xFFA726,0xFF9800,0xFB8C00,0xF57C00,0xEF6C00,0xE65100]
            assert(orange.count == GMDColorPrimaryLevel.count)
            return orange[level]
        case .DeepOrange:
            let deepOrange:[UInt] = [0xFF5722,0xFBE9E7,0xFFCCBC,0xFFAB91,0xFF8A65,0xFF7043,0xFF5722,0xF4511E,0xE64A19,0xD84315,0xBF360C]
            assert(deepOrange.count == GMDColorPrimaryLevel.count)
            return deepOrange[level]
        case .Brown:
            let brown:[UInt] = [0x795548,0xEFEBE9,0xD7CCC8,0xBCAAA4,0xA1887F,0x8D6E63,0x795548,0x6D4C41,0x5D4037,0x4E342E,0x3E2723]
            assert(brown.count == GMDColorPrimaryLevel.count)
            return brown[level]
        case .Grey:
            let grey:[UInt] = [0x9E9E9E,0xFAFAFA,0xF5F5F5,0xEEEEEE,0xE0E0E0,0xBDBDBD,0x9E9E9E,0x757575,0x616161,0x424242,0x212121]
            assert(grey.count == GMDColorPrimaryLevel.count)
            return grey[level]
        case .BlueGrey:
            let blueGrey:[UInt] = [0x607D8B,0xECEFF1,0xCFD8DC,0xB0BEC5,0x90A4AE,0x78909C,0x607D8B,0x546E7A,0x455A64,0x37474F,0x263238]
            assert(blueGrey.count == GMDColorPrimaryLevel.count)
            return blueGrey[level]
        case .Black:
            return UInt(0x000000)
        case .White:
            return UInt(0xFFFFFF)
        }
    }
    
    private static func getAccentColorData(colorType: GMDColorType, level: Int) -> UInt?{
        
        switch colorType{
        case .Red:
            let red:[UInt] = [0xFF8A80,0xFF5252,0xFF1744,0xD50000]
            assert(red.count == GMDColorAccentLevel.count)
            return red[level]
        case .Pink:
            let pink:[UInt] = [0xFF80AB,0xFF4081,0xF50057,0xC51162]
            assert(pink.count == GMDColorAccentLevel.count)
            return pink[level]
        case .Purple:
            let purple:[UInt] = [0xEA80FC,0xE040FB,0xD500F9,0xAA00FF]
            assert(purple.count == GMDColorAccentLevel.count)
            return purple[level]
        case .DeepPurple:
            let deepPurple:[UInt] = [0xB388FF,0x7C4DFF,0x651FFF,0x6200EA]
            assert(deepPurple.count == GMDColorAccentLevel.count)
            return deepPurple[level]
        case .Indigo:
            let indigo:[UInt] = [0x8C9EFF,0x536DFE,0x3D5AFE,0x304FFE]
            assert(indigo.count == GMDColorAccentLevel.count)
            return indigo[level]
        case .Blue:
            let blue:[UInt] = [0x82B1FF,0x448AFF,0x2979FF,0x2962FF]
            assert(blue.count == GMDColorAccentLevel.count)
            return blue[level]
        case .LightBlue:
            let lightBlue:[UInt] = [0x80D8FF,0x40C4FF,0x00B0FF,0x0091EA]
            assert(lightBlue.count == GMDColorAccentLevel.count)
            return lightBlue[level]
        case .Cyan:
            let cyan:[UInt] = [0x84FFFF,0x18FFFF,0x00E5FF,0x00B8D4]
            assert(cyan.count == GMDColorAccentLevel.count)
            return cyan[level]
        case .Teal:
            let teal:[UInt] = [0xA7FFEB,0x64FFDA,0x1DE9B6,0x00BFA]
            assert(teal.count == GMDColorAccentLevel.count)
            return teal[level]
        case .Green:
            let green:[UInt] = [0xB9F6CA,0x69F0AE,0x00E676,0x00C853]
            assert(green.count == GMDColorAccentLevel.count)
            return green[level]
        case .LightGreen:
            let lightGreen:[UInt] = [0xCCFF90,0xB2FF59,0x76FF03,0x64DD17]
            assert(lightGreen.count == GMDColorAccentLevel.count)
            return lightGreen[level]
        case .Lime:
            let lime:[UInt] = [0xF4FF81,0xEEFF41,0xC6FF00,0xAEEA00]
            assert(lime.count == GMDColorAccentLevel.count)
            return lime[level]
        case .Yellow:
            let yellow:[UInt] = [0xFFFF8D,0xFFFF00,0xFFEA00,0xFFD600]
            assert(yellow.count == GMDColorAccentLevel.count)
            return yellow[level]
        case .Amber:
            let amber:[UInt] = [0xFFE57F,0xFFD740,0xFFC400,0xFFAB00]
            assert(amber.count == GMDColorAccentLevel.count)
            return amber[level]
        case .Orange:
            let orange:[UInt] = [0xFFD180,0xFFAB40,0xFF9100,0xFF6D00]
            assert(orange.count == GMDColorAccentLevel.count)
            return orange[level]
        case .DeepOrange:
            let deepOrange:[UInt] = [0xFF9E80,0xFF6E40,0xFF3D00,0xDD2C00]
            assert(deepOrange.count == GMDColorAccentLevel.count)
            return deepOrange[level]
        default:
            return nil
        }
    }
    
    static private func primaryWhiteTextColorBound(colorType: GMDColorType) -> Int{
        let bounds:[Int] = [5, 4, 4, 4, 4, 6, 7, 8, 6, 7, 8, 10, 11, 11, 9, 6, 4, 7, 5, 0, 11]
        assert(bounds.count == GMDColorType.count)
        return bounds[colorType.rawValue]
    }
    
    static private func accentWhiteTextColorBound(colorType: GMDColorType) -> Int?{
        let bounds:[Int] = [1, 1, 1, 1, 1, 1, 3, 4, 4, 4, 4, 4, 4, 4, 4, 2]
        assert(bounds.count == GMDColorType.accentCount)
        
        if colorType.rawValue >= GMDColorType.accentCount{
            return nil
        }
        return bounds[colorType.rawValue]
    }
}

