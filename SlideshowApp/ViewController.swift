//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 傳田和樹 on 2021/02/17.
//

import UIKit

class ViewController: UIViewController {
    //outlletの接続
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var suraidshow: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    var timer: Timer!
    var timer_sec: Float = 0
    var imageNo = 0
    
    let imageName = ["S__img1.jpg", "S__img2.jpg", "S__img3.jpg"]
    
    //進むボタンを押した時の動作
    
    @IBAction func next(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 1
        }else if imageNo == 1 {
            imageNo = 2
        }else if imageNo == 2 {
            imageNo = 0
        }
        let name = imageName[imageNo]
        
        imageView.image = UIImage(named:name)
        
    }
    
    
    //戻るボタンを押した時の動作
    @IBAction func back(_ sender: Any) {
        
        if imageNo == 1 {
            imageNo = 0
        }else if imageNo == 2 {
            imageNo = 1
        }else if imageNo == 0 {
            imageNo = 2
        }
        
        let name = imageName[imageNo]
        
        imageView.image = UIImage(named:name)
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "S__img1.jpg")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueから遷移先のSecoundを取得する
        let secound:secound = segue.destination as! secound
        //画像のデータを渡す
        secound.name2 = imageView.image!
        self.timer.invalidate()   // タイマーを停止する
        
    }
    
    //スライドが2秒毎に切り替わる動作
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2
        
        if imageNo == 0 {
            imageNo = 1
        }else if imageNo == 1 {
            imageNo = 2
        }else if imageNo == 2 {
            imageNo = 0
        }
        let name = imageName[imageNo]
        
        imageView.image = UIImage(named:name)
        
    }
    
    
    
    //再生の動作//停止の動作
    @IBAction func suraidshow(_ sender: Any) {
        
        //タイマーの設定
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //UIButtonを無効化
            susumu.isEnabled = false
            //UIButtonを無効化
            modoru.isEnabled = false
            
            suraidshow.setTitle("停止", for: .normal)
        
        } else {
            if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil
              
                suraidshow.setTitle("再生", for: .normal)
               
                //UIOutletを有効化
                susumu.isEnabled = true
                //UIOutlletを有効化
                modoru.isEnabled = true
            }
            
            
            
            
        }
       
    }
    
    
}










