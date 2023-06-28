//
//  ViewController.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    //MARK: сущность Игра
    var game: Game!
    
    //MARK: элементы на сцене
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    //MARK: жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        //создаем генератор случайных чисел
        let generator = Generator(startValue: 1, endValue: 50)!
        //создаем экземпляр сущности Игра
        game = Game(valueGenerator: generator, rounds: 5)
        
        //обновляем данные о текущем загаданном числе
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    @IBAction func checkNumber() {
        
        //подсчет очков
        game.currentRound.calculateScore(with: Int(slider.value))
        
        //если прошло предедльное количество раундов - выводим информационное окно. Если нет - начинаем нвоый раунд
        if game.isGameEnded {
            showAlert(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        //обновляем текущее загаданное число
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    //Метод для обновления текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
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
    
    //MARK: взаимодействие со вторым экраном
    
    //ленивое свойство для хранения View Controller
//    lazy var secondViewController: SecondViewController = getSecondViewController()
//
//    //приватный метод, загружающий View Controller
//    private func getSecondViewController() -> SecondViewController {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
//        return viewController as! SecondViewController
//    }
    
   
        
//        //создаем метку для вывода номера версии приложения
//        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        //изменяем текст метки
//        versionLabel.text = "Версия 1.1"
//        //добавляем метку в родительский View
//        self.view.addSubview(versionLabel)
    

    //MARK: продолжение жизненного цикла
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    //MARK: возврат на стартовый экран
    @IBAction func BackStartScene() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

