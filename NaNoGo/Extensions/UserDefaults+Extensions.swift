//
//  UserDefaults+Extensions.swift
//  NaNoGo
//
//  Created by Lizz Clark on 15/07/2020.
//

import Foundation
import SwiftUI

extension UserDefaults {
    func set(_ value: Color, forKey key: String) {
        let uiColor = UIColor(value)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        UserDefaults.standard.set(red, forKey: "red.\(key)")
        UserDefaults.standard.set(green, forKey: "green.\(key)")
        UserDefaults.standard.set(blue, forKey: "blue.\(key)")
        UserDefaults.standard.set(alpha, forKey: "alpha.\(key)")
        UserDefaults.standard.set(true, forKey: key)
    }
    
    func color(forKey key: String) -> Color? {
        if UserDefaults.standard.bool(forKey: key) == true {
            let red = UserDefaults.standard.double(forKey: "red.\(key)")
            let green = UserDefaults.standard.double(forKey: "green.\(key)")
            let blue = UserDefaults.standard.double(forKey: "blue.\(key)")
            let alpha = UserDefaults.standard.double(forKey: "alpha.\(key)")
            return Color(red: red, green: green, blue: blue, opacity: alpha)
        } else {
            return nil
        }
    }
}
