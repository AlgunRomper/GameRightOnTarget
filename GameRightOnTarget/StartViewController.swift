//
//  StartViewController.swift
//  GameRightOnTarget
//
//  Created by Algun Romper  on 08.04.2023.
//

import UIKit

class StartViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var viewController: ViewController = getViewController()
    
    //приватный метод, загружающий View Controller
    private func getViewController() -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "ViewController")
        return viewController as! ViewController
    }
    
    @IBAction func ShowSelectNumber() {
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    //приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    @IBAction func ShowSelectColor() {
        self.present(secondViewController, animated: true, completion: nil)
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
