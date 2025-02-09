//
//  CautionTestData.swift
//  Clinical Psychology 1-A
//
//  Created by Muzaffer Sevili on 27.01.2025.
//

import SwiftUI

struct CautionTestData: Codable {
    let timeStamp: String
    let photoPairNumber: Int
    let neutralPhotoPosition: String
    let ocdPhotoPosition: String
    let arrowDirection: String
    let arrowPosition: String
    let givenAnswer: String
    let isAnswerCorrect: Bool
    let responseTime: Int
}
