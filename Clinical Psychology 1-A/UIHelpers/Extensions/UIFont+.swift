//
//  UIFont+.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

// Enum for different font styles
enum FontStyle: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
}

// Enum for custom fonts
enum CustomFont: String {
    
    case roboto = "Roboto"
    
    var defaultSize: CGFloat {
        return UIFont.preferredFont(forTextStyle: .body).pointSize
    }
    
    static var `default`: Font {
        return CustomFont.roboto.font(style: .regular, size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    }
    
    func font(style: FontStyle, size: CGFloat) -> Font {
        let fontName = "\(self.rawValue)-\(style.rawValue)"
        return Font.custom(fontName, size: size)
    }
    
    func font(style: FontStyle, size: CGFloat) -> UIFont {
        let fontName = "\(self.rawValue)-\(style.rawValue)"
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
    }
}

// Extension on Font to use custom fonts easily
extension Font {
    static func custom(_ font: CustomFont = .roboto, style: FontStyle = .regular, size: CGFloat) -> Font {
        return font.font(style: style, size: size)
    }
}

// Extension on Font to use custom fonts easily
extension UIFont {
    static func custom(_ font: CustomFont = .roboto, style: FontStyle = .regular, size: CGFloat) -> UIFont {
        return font.font(style: style, size: size)
    }
}
