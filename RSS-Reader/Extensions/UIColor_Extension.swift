//
//  UIColor_Extension.swift
//  RSS-Reader
//
//  Created by MBAir on 12/5/21.
//

import UIKit

extension UIColor {
    
    static let Palette: [String: UIColor] = [
        
        // Cell Background Colors
        "bgColor1": #colorLiteral(red: 0.7019607843, green: 0.8235294118, blue: 0.5529411765, alpha: 0.8465860445),              // #B3D28D
        "bgColor2": #colorLiteral(red: 0.7921568627, green: 0.7098039216, blue: 0.6901960784, alpha: 0.85),              // #EBE6CA
        "bgColor3": #colorLiteral(red: 0.8823529412, green: 0.768627451, blue: 0.6039215686, alpha: 0.85),              // #E1C49A
        "bgColor4": #colorLiteral(red: 0.9333333333, green: 0.8431372549, blue: 0.6588235294, alpha: 0.85),              // #EED7A8
    ]
    
    enum PaletteName: String {
        
        case bgColor1, bgColor2, bgColor3, bgColor4
        
        var color: UIColor {
            guard let color = UIColor.Palette[self.rawValue] else {
                fatalError("no color defined for name \(self.rawValue)")
            }
            return color
        }
    }
    
    static let cellBackgroundColor: [Int : UIColor] = [0 : PaletteName.bgColor1.color,
                                                       1 : PaletteName.bgColor2.color,
                                                       2 : PaletteName.bgColor3.color,
                                                       3 : PaletteName.bgColor4.color]
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
