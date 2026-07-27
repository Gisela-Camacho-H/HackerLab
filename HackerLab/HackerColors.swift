//
//  HackerColors.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

extension Color {
    static let darkGreenBackground = Color(hex: "061A12")
    static let darkGreenGradientEnd = Color(hex: "020D09")
    

    static let hackerGreen = Color(hex: "00FF85")
    static let hackerBlue = Color(hex: "1E90FF")
    static let hackerPink = Color(hex: "FF0099")
    static let hackerYellow = Color(hex: "DFFF00")
    static let hackerPurple = Color(hex: "BF00FF")
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        r = (int >> 16) & 0xff
        g = (int >> 8) & 0xff
        b = int & 0xff
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: 1)
    }
}
