//
//  Game.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 03.04.2023.
//

import Foundation

protocol GameProtocol {
    
    //свойство для хранения очков
    var score: Int { get }
    
    var secretValueGenerator: GeneratorProtocol { get }

    var currentRound: RoundProtocol! { get }
 
    //проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    
    //метод для перезапуска игры
    func restartGame()
    
    //метод для запуска нового раунда
    func startNewRound()
    
}

class Game: GameProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: RoundProtocol!
    private var rounds: [RoundProtocol] = []
    
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int?
    
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
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
        let newSecretValue = getNewSecretValue()
        currentRound = Round(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    //Генерация случайного числа
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getNewSecretValue()
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
