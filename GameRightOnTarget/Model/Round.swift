//
//  Round.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 03.04.2023.
//

import Foundation

protocol RoundProtocol {
    
    //свойство для хранения очков
    var score: Int { get }
    
    //загаданное секретное число
    var currentSecretValue: Int! { get }
    
    //метод для подсчета очков
    func calculateScore(with value: Int)
}

class Round: RoundProtocol {
    
    var score: Int = 0
    
    var currentSecretValue: Int! = 0
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 + value - currentSecretValue
        } else {
            score += 50
        }
    }
}
