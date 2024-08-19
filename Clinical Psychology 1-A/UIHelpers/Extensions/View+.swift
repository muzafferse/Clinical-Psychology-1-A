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

extension View {
    func alignHorizontally(_ alignment: HorizontalAlignment, _ value: CGFloat = 0) -> some View {
        HStack(spacing: 0) {
            Spacer.width(alignment == .leading ? value : nil)
            self
            Spacer.width(alignment == .trailing ? value : nil)
        }
    }
}

// A private ViewModifier to add an invisible view capturing the height using GeometryReader.
private struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }
    
    // Applying the modifier to the content view.
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

// A PreferenceKey to store and share the captured height information.
struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?
    
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
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
