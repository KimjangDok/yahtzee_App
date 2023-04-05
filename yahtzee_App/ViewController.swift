//
//  ViewController.swift
//  yahtzee_App
//
//  Created by Kim Janghyun on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceView1: UIImageView!
    @IBOutlet weak var diceView2: UIImageView!
    @IBOutlet weak var diceView3: UIImageView!
    @IBOutlet weak var diceView4: UIImageView!
    @IBOutlet weak var diceView5: UIImageView!
    
    @IBOutlet weak var rollButton: UIButton!
    
    @IBOutlet weak var count: UILabel!
    
    var countAttempt = 0
    
    var clickedFlag1 = false
    var clickedFlag2 = false
    var clickedFlag3 = false
    var clickedFlag4 = false
    var clickedFlag5 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        diceView1.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView2.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView3.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView4.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView5.image = UIImage(imageLiteralResourceName: "diceOne_96")
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped1))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped4))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped5))
        
        diceView1.isUserInteractionEnabled = true
        diceView1.addGestureRecognizer(tapGesture1)
        
        diceView2.isUserInteractionEnabled = true
        diceView2.addGestureRecognizer(tapGesture2)
        
        diceView3.isUserInteractionEnabled = true
        diceView3.addGestureRecognizer(tapGesture3)
        
        diceView4.isUserInteractionEnabled = true
        diceView4.addGestureRecognizer(tapGesture4)
        
        diceView5.isUserInteractionEnabled = true
        diceView5.addGestureRecognizer(tapGesture5)
        
        //rollButtonPressed
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let n1 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n2 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n3 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n4 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n5 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        
//        var m1 = 0
//        var m2 = 0
//        var m3 = 0
//        var m4 = 0
//        var m5 = 0
        
        let na = [n1, n2, n3, n4, n5]
        //var ma = [n1, n2, n3, n4, n5]
        
        
        print(na)
        //print(ma[0])
        
        diceImageChange(var1: n1, var2: n2, var3: n3, var4: n4, var5: n5)

        
//        if(!bar1.isHidden){
//            print("BAR EXISTs")
//            diceImageChange(var1: ma[0], var2: n2, var3: n3, var4: n4, var5: n5)
//        } else {
//
//            diceImageChange(var1: n1, var2: n2, var3: n3, var4: n4, var5: n5)
//
//        }
        
        
        //ma.setV
        
        //print(ma[0])
        
        //print("ma[0]: \(ma[0])")
        
        countAttempt = countAttempt + 1
        
        if(countAttempt > 3){ countAttempt = 1 }
        count.text = String(countAttempt)
        
    }
    
    func diceImageChange(var1:Int, var2:Int, var3:Int, var4:Int, var5:Int){
        
        diceView1.image = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")][var1-1]
        diceView2.image = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")][var2-1]
        diceView3.image = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")][var3-1]
        diceView4.image = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")][var4-1]
        diceView5.image = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")][var5-1]
        
    }
    
    @objc func imageTapped1(sender: UITapGestureRecognizer){
        if(clickedFlag1){
            clickedFlag1 = false
            diceView1.image = UIImage(imageLiteralResourceName: "diceOne_96")
        }
        else if(!clickedFlag1){
            clickedFlag1 = true
            diceView1.image = UIImage(imageLiteralResourceName: "diceOne_32")
        }
        print("tapped 1")
    }
    @objc func imageTapped2(sender: UITapGestureRecognizer){
        print("tapped 2")
    }
    @objc func imageTapped3(sender: UITapGestureRecognizer){
        print("tapped 3")
    }
    @objc func imageTapped4(sender: UITapGestureRecognizer){
        print("tapped 4")
    }
    @objc func imageTapped5(sender: UITapGestureRecognizer){
        print("tapped 5")
    }
    

}

