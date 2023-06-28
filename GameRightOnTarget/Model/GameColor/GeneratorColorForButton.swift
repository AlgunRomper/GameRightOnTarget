//
//  GeneratorColorForButton.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 28.06.2023.
//

import Foundation
import SwiftUI

protocol GeneratorColorForButtonProtocol {
    
    //Генерация случайного цвета
    func randomButtonColors() -> [UIColor]

}

class GeneratorColorForButton: GeneratorColorForButtonProtocol {
    
    func randomButtonColors() -> [UIColor] {
        var arrayOfColorForButtons: [UIColor] = []
            
        let randomColor1 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        let randomColor2 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        let randomColor3 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        let randomColor4 = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        
        arrayOfColorForButtons.append(randomColor1)
        arrayOfColorForButtons.append(randomColor2)
        arrayOfColorForButtons.append(randomColor3)
        arrayOfColorForButtons.append(randomColor4)
        
        return arrayOfColorForButtons
    }
    

}
