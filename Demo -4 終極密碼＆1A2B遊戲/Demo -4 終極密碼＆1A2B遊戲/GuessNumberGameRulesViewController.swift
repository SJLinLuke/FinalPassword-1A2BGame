//
//  GuessNumberGameRulesViewController.swift
//  Demo -4 終極密碼＆1A2B遊戲
//
//  Created by LukeLin on 2022/1/9.
//

import UIKit

class GuessNumberGameRulesViewController: UIViewController {

    @IBOutlet var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = 20
            startButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var gameruleView: UIView! {
        didSet {
            gameruleView.layer.borderWidth = 10
        }
    }
    @IBOutlet var selectMode: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //回傳直到下一個Segue
    @IBSegueAction func gmaeModeInt(_ coder: NSCoder) -> UIViewController? {
        if let controller = GuessNumberGameViewController(coder: coder), let selectMode = selectMode.titleForSegment(at: selectMode.selectedSegmentIndex) {
            controller.modenumber = Int(selectMode)
            return controller
            
        }else {
            return nil
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

}
