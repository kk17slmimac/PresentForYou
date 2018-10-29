//
//  ViewController.swift
//  PresentForYou
//
//  Created by 久保田慧 on 2018/10/26.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit
//UIKitとはボタンとかラベルとかの部品のこと


class ViewController: UIViewController {

    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var forest: UIImageView!
    @IBOutlet weak var home_left: UIImageView!
    @IBOutlet weak var home_center: UIImageView!
    @IBOutlet weak var home_wright: UIImageView!
    
    @IBOutlet weak var dog_label: UILabel!
    @IBOutlet weak var clock_label: UILabel!
    //タイマーを用意する
    var timer: Timer!
    
    override func viewDidLoad() {
        //funcはどうするぅー？　function(関数の略)
        //viewDidLoad:画面を読み込んだ時。つまりアプリを開いて一番最初
        self.dog_label.isHidden = true
        
        //タイマーをセットする
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: "updateClock", userInfo: nil, repeats: true)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //updateClock呼ばれたらどうするぅ？
    func updateClock(){
        //今の時間教えて
        let now = Date()
        //翻訳してくれる人を用意
        let formatter = DateFormatter()
        //翻訳形式を決める
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        //翻訳してよ
        let nowString = formatter.string(from: now)
        //ラベルに入れる
        self.clock_label.text = nowString
    }
    
    
    @IBAction func tupButton(_ sender: Any) {
        self.selectLabel.text = "出た！"
        
        //乱数を教えてよ
        let random = arc4random()%4
        
        if random == 1 | 2{
            self.forest.isHidden = true
        }
        else if random == 0 {
            self.forest.isHidden = false
        }
            
        else {
            self.forest.image = UIImage(named:"家")
        }
    
    }
    
    @IBAction func tap_left(_ sender: Any) {
        self.home_left.image = UIImage(named: "象")
    }
    
    @IBAction func tap_wright(_ sender: Any) {
    self.home_wright.image = UIImage(named: "犬")
    self.dog_label.isHidden = false
        UIView.animate(withDuration: 2.0) {
            self.dog_label.frame.origin.x = 300
    }
    }
    
    @IBAction func swipe_home(_ sender: Any) {
        self.home_center.image = UIImage(named: "りす")
        
    }
    
    
    
}


