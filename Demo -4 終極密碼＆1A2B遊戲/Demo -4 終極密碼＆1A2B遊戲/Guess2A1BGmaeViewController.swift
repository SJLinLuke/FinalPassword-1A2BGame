//
//  Guess2A1BGmaeViewController.swift
//  Demo -4 終極密碼＆1A2B遊戲
//
//  Created by LukeLin on 2022/1/10.
//

import UIKit

class Guess2A1BGmaeViewController: UIViewController {

    @IBOutlet var statusView: UIView! {
        didSet {
            statusView.layer.cornerRadius = 15
            statusView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var inputNumber: UITextField!
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var statusLabel: UITextView! {
        didSet {
            statusLabel.layer.cornerRadius = 15
            statusLabel.layer.masksToBounds = true
        }
    }
    
    @IBAction func guessButton(_ sender: UIButton) {
        if inputNumber.text?.count == 4 {
           if let input = inputNumber.text {
               let result = checkNumber (input: input, topic: topic)
               statusLabel.text += "\(input):\(result.0)A\(result.1)B \n"
               inputNumber.text = ""
            }
        }else {
            let alertcontroller = UIAlertController(title: "輸入錯誤", message: "輸入數值並非4位數，請重新輸入", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        }
    }
    @IBAction func restartButton(_ sender: UIButton) {
        statusLabel.text = ""
        time = 0.0
        getTimer()
        inputNumber.text = ""
        topic = ""
        getnewTopic()
        statusLabel.text = "START!! \n"
    }
    
    @IBAction func checkInputNumber (_ sender: UITextField) {
        if let input = sender.text {
            let InputArray = Array(input)
            let SetArray = Set(input)
            
            if InputArray.count != SetArray.count {
                let alertcontroller = UIAlertController(title: "輸入錯誤", message: "請輸入四個不重複的數字", preferredStyle: .alert)
                alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertcontroller, animated: true, completion: nil)
                sender.text?.removeLast()
            }
        }
        if sender.text?.count == 5 {
            let alertcontroller = UIAlertController(title: "輸入錯誤", message: "請輸入四位數字", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
        }
    }
    
    var topic = ""
    var time = 0.0
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        //生成題目
        getnewTopic()
        
        //生成計時器
        getTimer()
        
        //顯示開始
        statusLabel.text = "START!! \n"
        // Do any additional setup after loading the view.
    }
    
    //判斷幾Ａ幾Ｂ
    func checkNumber (input: String, topic: String) -> (Int, Int) {
        var resultA = 0
        var resultB = 0
        let inputArray = Array(input)
        let topicArray = Array(topic)
        
        for i in 0...3 {
            for j in 0...3 {
                if topicArray[i] == inputArray[j] && i==j {
            resultA += 1
                } else if topicArray[i] == inputArray[j] {
            resultB += 1
                }
            }
            if resultA == 4 {
                timer?.invalidate()
                let timetext = String(format: "%1f", time)
                let alertcontroller = UIAlertController(title: "恭喜通關！", message: "總耗時\(timetext)秒", preferredStyle: .alert)
                alertcontroller.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                present(alertcontroller, animated: true, completion: nil)
            }
        }
        return (resultA, resultB)
    }
    //獲得題目
    func getnewTopic () {
        var number = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        
        for _ in 0...3 {
            let index = Int.random(in: 0..<number.count)
            topic += number[index]
            number.remove(at: index)
        }
        print(topic)
    }
    

    //計時器
    func getTimer () {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //計時器功能
    @objc func updateTimer(){
        time += 0.1
        timeLabel.text = String(format: "%.1f", time)
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

extension Guess2A1BGmaeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
