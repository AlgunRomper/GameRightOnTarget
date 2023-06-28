//
//  GameColor.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 08.04.2023.
//

import Foundation
import UIKit

protocol GameColorProtocol {
    
    //свойство для хранения очков
    var score: Int { get }
    
    var buttonsColorGenerator: GeneratorColorForButtonProtocol { get }
    var secretColorGenerator: GeneratorColorProtocol { get }

    var currentRound: RoundColorProtocol! { get }
 
    //проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    
    //метод для перезапуска игры
    func restartGame()
    
    //метод для запуска нового раунда
    func startNewRound()
    
}

class GameColor: GameColorProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: RoundColorProtocol!
    private var rounds: [RoundColorProtocol] = []
    
    var buttonsColorGenerator: GeneratorColorForButtonProtocol
    var secretColorGenerator: GeneratorColorProtocol
    private var roundsCount: Int?
    
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(buttonsGenerator: GeneratorColorForButtonProtocol, colorGenerator: GeneratorColorProtocol, rounds: Int) {
        buttonsColorGenerator = buttonsGenerator
        secretColorGenerator = colorGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    //начать новую игру
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    //начать новый раунд
    func startNewRound() {
        let buttonsColors = randomButtonColors()
        let newSecretColor = getNewSecretColorHex(color: buttonsColors.randomElement() ?? .black)
        currentRound = RoundColor(secretColor: newSecretColor, randomButtonsColors: buttonsColors)
        rounds.append(currentRound)
    }
    
    //Генерация цветов кнопок
    private func randomButtonColors() -> [UIColor] {
        return buttonsColorGenerator.randomButtonColors()
        
    }
    
    //Генерация случайного цвета
    private func getNewSecretColorHex(color: UIColor) -> String {
        return secretColorGenerator.getNewSecretColorHex(color: (randomButtonColors().randomElement() ?? .black))
    }
    
    
}
