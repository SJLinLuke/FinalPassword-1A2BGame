//
//  GuessNumberGameViewController.swift
//  Demo -4 終極密碼＆1A2B遊戲
//
//  Created by LukeLin on 2022/1/9.
//

import UIKit

class GuessNumberGameViewController: UIViewController {

    @IBOutlet var statusView: UIView! {
        didSet {
            statusView.layer.borderWidth = 3
        }
    }
    
    var modenumber: Int!
    @IBOutlet var rangeLabel: UILabel!
    @IBOutlet var heartImage: [UIImageView]!
    @IBOutlet var userInput: UITextField! {
        didSet {
            userInput.layer.cornerRadius = 15
            userInput.layer.masksToBounds = true
        }
    }
    //隨機數字之預設
    var maxnumber = 0
    var minnumber = 0
    var answer = 0
    var wrongtimes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //產生隨機數字
        if let modenumber = modenumber {
            maxnumber = modenumber
            rangeLabel.text = "\(minnumber)~\(maxnumber)"
            answer = Int.random(in: minnumber...maxnumber)
            print(answer)
        }
        // Do any additional setup after loading the view.
    }
    
    //輸入數字
    @IBAction func inputNumber(sneder: UIButton) {
        if let newnumber = userInput.text, let number = Int(newnumber) {
            checknumber(number:number)
        }
    }
    
    //才錯扣機會
    func losechance (wrongtimes: Int) {
        for x in 0 ... wrongtimes {
            heartImage[x].image = UIImage(systemName: "xmark")
            
        }
    }
    
    //判斷數字
    func checknumber(number:Int) {
        if number < minnumber || number > maxnumber {
            let alertcontroller = UIAlertController(title: "輸入錯誤", message: "請重新輸入", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        } else {
            if number == answer {
            let alertcontroller = UIAlertController(title: "恭喜答對", message: "再來一次", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                losechance(wrongtimes: wrongtimes)
                wrongtimes += 1
            present(alertcontroller, animated: true, completion: nil)
        } else if number < answer {
            minnumber = number
            rangeLabel.text = "\(minnumber)~\(maxnumber)"
            losechance(wrongtimes: wrongtimes)
            wrongtimes += 1
        } else {
            maxnumber = number
            rangeLabel.text = "\(minnumber)~\(maxnumber)"
            losechance(wrongtimes: wrongtimes)
            wrongtimes += 1
        }
            if wrongtimes == 5 {
                let alertcontroller = UIAlertController(title: "挑戰失敗", message: "遊戲已重置請繼續輸入", preferredStyle: .alert)
                alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertcontroller, animated: true, completion: {
                    self.wrongtimes = 0
                    self.minnumber = 0
                    self.maxnumber = self.modenumber
                    self.rangeLabel.text = "\(self.minnumber)~\(self.maxnumber)"
                    self.answer = Int.random(in: self.minnumber...self.maxnumber)

                    self.heartImage[0].image = UIImage(named: "love")
                    self.heartImage[1].image = UIImage(named: "love")
                    self.heartImage[2].image = UIImage(named: "love")
                    self.heartImage[3].image = UIImage(named: "love")
                    self.heartImage[4].image = UIImage(named: "love")
                    
                    
                } )
            }
            

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
extension GuessNumberGameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
