//
//  SecondViewController.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 23.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
  
    override func loadView() {
        super.loadView()
        print("loadSecondView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("secondViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("secondViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("secondViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("secondViewDidDisappear")
    }
    
    //MARK: Возврат на стартовый экран
    @IBAction func BackStartScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:  Игра
    var gameColor: GameColor!
//
    @IBOutlet var label: UILabel!
    @IBOutlet var botton1: UIButton!
    @IBOutlet var botton2: UIButton!
    @IBOutlet var botton3: UIButton!
    @IBOutlet var botton4: UIButton!
    

//    func whatBottonPressed(UIButton) -> UIButton {
//
//        return pressedButton: UIButton
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

//        //создаем генератор случайных цветов
        let generator = GeneratorColorHex()
        
        //создаем генератор цветов для кнопок
        let generatorButtons = GeneratorColorForButton()
        
//        //создаем экземпляр сущности Игра
        gameColor = GameColor(buttonsGenerator: generatorButtons, colorGenerator: generator, rounds: 5)
//
//        //обновляем данные о текущем загаданном цвете
        updateLabelWithSecretColor(newText: String(gameColor.currentRound.currentSecretColor))
        
        //обновляем цвета кнопок
        updateButtonColors(newColors: gameColor.currentRound.buttonsColors)
    }
    
    @IBAction func checkColorButton1() {

        //подсчет очков
        gameColor.currentRound.calculateScore(with: botton1.backgroundColor!)

        //если прошло предельное количество раундов - выводим информационное окно. Если нет - начинаем новый раунд
        if gameColor.isGameEnded {
            showAlert(score: gameColor.score)
            gameColor.restartGame()
        } else {
            gameColor.startNewRound()
        }

        //обновляем текущий загаданный цвет
        updateLabelWithSecretColor(newText: (gameColor.currentRound.currentSecretColor))
        
        //обновляем цвета кнопок
        updateButtonColors(newColors: gameColor.currentRound.buttonsColors)
    }

    @IBAction func checkColorButton2() {

        //подсчет очков
        gameColor.currentRound.calculateScore(with: botton2.backgroundColor!)

        //если прошло предельное количество раундов - выводим информационное окно. Если нет - начинаем новый раунд
        if gameColor.isGameEnded {
            showAlert(score: gameColor.score)
            gameColor.restartGame()
        } else {
            gameColor.startNewRound()
        }

        //обновляем текущий загаданный цвет
        updateLabelWithSecretColor(newText: (gameColor.currentRound.currentSecretColor))
        
        //обновляем цвета кнопок
        updateButtonColors(newColors: gameColor.currentRound.buttonsColors)
    }
    @IBAction func checkColorButton3() {

        //подсчет очков
        gameColor.currentRound.calculateScore(with: botton3.backgroundColor!)

        //если прошло предельное количество раундов - выводим информационное окно. Если нет - начинаем новый раунд
        if gameColor.isGameEnded {
            showAlert(score: gameColor.score)
            gameColor.restartGame()
        } else {
            gameColor.startNewRound()
        }

        //обновляем текущий загаданный цвет
        updateLabelWithSecretColor(newText: (gameColor.currentRound.currentSecretColor))
        
        //обновляем цвета кнопок
        updateButtonColors(newColors: gameColor.currentRound.buttonsColors)
    }

    @IBAction func checkColorButton4() {

        //подсчет очков
        gameColor.currentRound.calculateScore(with: botton4.backgroundColor!)

        //если прошло предельное количество раундов - выводим информационное окно. Если нет - начинаем новый раунд
        if gameColor.isGameEnded {
            showAlert(score: gameColor.score)
            gameColor.restartGame()
        } else {
            gameColor.startNewRound()
        }

        //обновляем текущий загаданный цвет
        updateLabelWithSecretColor(newText: (gameColor.currentRound.currentSecretColor))
        
        //обновляем цвета кнопок
        updateButtonColors(newColors: gameColor.currentRound.buttonsColors)
    }


    //Метод для обновления текста загаданного числа
    private func updateLabelWithSecretColor(newText: String) {
        label.text = newText
    }
    
    //Метод для обновления цветов кнопок
    private func updateButtonColors(newColors: [UIColor]) {
        botton1.backgroundColor = newColors[0]
        botton2.backgroundColor = newColors[1]
        botton3.backgroundColor = newColors[2]
        botton4.backgroundColor = newColors[3]
    }

    //Отображение всплывающего окна с отчетом
    private func showAlert(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
