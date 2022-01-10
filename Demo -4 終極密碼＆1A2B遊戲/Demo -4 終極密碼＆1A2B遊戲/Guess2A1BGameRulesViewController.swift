//
//  Guess2A1BGameRulesViewController.swift
//  Demo -4 終極密碼＆1A2B遊戲
//
//  Created by LukeLin on 2022/1/10.
//

import UIKit

class Guess2A1BGameRulesViewController: UIViewController {

    @IBOutlet var statusView: UIView! {
        didSet {
            statusView.layer.cornerRadius = 15
            statusView.layer.masksToBounds = true
        }
    }
    @IBOutlet var rulesView: UIView! {
        didSet {
            rulesView.layer.cornerRadius = 15
            rulesView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 20
            startButton.layer.masksToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
