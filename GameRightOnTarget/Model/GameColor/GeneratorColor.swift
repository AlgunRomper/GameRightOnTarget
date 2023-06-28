//
//  GeneratorColor.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 08.04.2023.
//

import UIKit
import SwiftHEXColors

protocol GeneratorColorProtocol {
    
    //Генерация случайного цвета
    func getNewSecretColorHex(color: UIColor) -> String
}

class GeneratorColorHex: GeneratorColorProtocol {
    
    
    //Генерация случайного цвета
    func getNewSecretColorHex(color: UIColor) -> String {
        guard let components = color.cgColor.components, components.count >= 3 else {
                return ""
            }
            
            let red = components[0]
            let green = components[1]
            let blue = components[2]
            
            let hexString = String(format: "#%02lX%02lX%02lX",
                                   lroundf(Float(red) * 255),
                                   lroundf(Float(green) * 255),
                                   lroundf(Float(blue) * 255))
            
            return hexString
        
//        let letters = "0123456789ABCDEF"
//        var color = "#"
//
//        for _ in 0..<6 {
//            let index = Int(arc4random_uniform(UInt32(letters.count)))
//            let letter = letters[letters.index(letters.startIndex, offsetBy: index)]
//            color.append(letter)
//        }
//
//        return color
    }
}
