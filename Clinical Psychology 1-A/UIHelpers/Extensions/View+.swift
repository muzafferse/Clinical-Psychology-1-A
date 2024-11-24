//
//  View+.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}

extension View {
    func frame(_ size: CGFloat) -> some View { frame(width: size, height: size, alignment: .center) }
}

// MARK: - Hide keyboard
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

// MARK: - Navigation Bar Color
extension View {
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}

// MARK: - Font Modifiers
extension View {
    func robotoMediumFont(size: CGFloat) -> some View {
        self.font(.custom(.roboto, style: .medium, size: size))
    }
    
    func robotoRegularFont(size: CGFloat) -> some View {
        self.font(.custom(.roboto, style: .regular, size: size))
    }
}

// MARK: - Button Modifiers
extension View {
    func primaryActiveButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(PrimaryActiveButtonStyle())))
    }
    
    func primaryInactiveButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(PrimaryInactiveButtonStyle())))
    }
    
    func textButtonStyle() -> some View {
        self.buttonStyle(.customButton(.constant(TextButtonStyle())))
    }
}

//MARK: - Back Button Modifier
extension View {
    func backButton(text: String) -> some View {
        self.modifier(BackButton(text: text))
    }
}
