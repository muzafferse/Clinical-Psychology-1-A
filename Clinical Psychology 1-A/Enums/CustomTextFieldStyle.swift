//
//  CustomTextFieldStyle.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 17.04.2024.
//

import SwiftUI

protocol CustomTextFieldStyle {
    var leftIcon: Image? { get set }
    var leftEmptyIcon: Image? { get set }
    var rightIcon: Image? { get set }
    var rightTransparentIcon: Image? { get set }
    var isHidden: Bool { get set }
}

struct UsernameTextFieldStyle: CustomTextFieldStyle {
    var leftIcon: Image? = Image(systemName: "person.fill")
    var leftEmptyIcon: Image? = Image(systemName: "person")
    var rightIcon: Image? = nil
    var rightTransparentIcon: Image? = nil
    var isHidden: Bool = false
}

struct PasswordTextFieldStyle: CustomTextFieldStyle {
    var leftIcon: Image? = Image(systemName: "lock.fill")
    var leftEmptyIcon: Image? = Image(systemName: "lock")
    var rightIcon: Image? = Image(systemName: "eye")
    var rightTransparentIcon: Image? = Image(systemName: "eye.slash")
    var isHidden: Bool = true
}
