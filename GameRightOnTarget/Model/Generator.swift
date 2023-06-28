//
//  Generator.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 03.04.2023.
//

import Foundation

protocol GeneratorProtocol {
    
    //Генерация случайного числа
    func getNewSecretValue() -> Int
}

class Generator: GeneratorProtocol {
    
    private var minSecretValue: Int
    
    private var maxSecretValue: Int
    
    init?(startValue: Int, endValue: Int) {
        //стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    //Генерация случайного числа
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}
