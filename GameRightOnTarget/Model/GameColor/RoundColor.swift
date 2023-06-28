//
//  RoundColor.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 08.04.2023.
//

import Foundation
import UIKit

protocol RoundColorProtocol {
    
    //свойство для хранения очков
    var score: Int { get }
    
    //загаданный секретный цвет
    var currentSecretColor: String { get }
    
    //цвета кнопок
    var buttonsColors: [UIColor] { get }
    
    //метод для подсчета очков
    func calculateScore(with color: UIColor)
}

class RoundColor: RoundColorProtocol {
    
    var score: Int = 0
    
    var currentSecretColor: String = "#000000"
    var buttonsColors: [UIColor]  = [.black, .black, .black, .black]
    
    
    init(secretColor: String, randomButtonsColors: [UIColor]) {
        currentSecretColor = secretColor
        buttonsColors = randomButtonsColors
    }
    
    func calculateScore(with color: UIColor) {
        if color == UIColor(hexString: currentSecretColor) {
            score += 50
        }
    }
}
