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
    
    var countAttempt = 1
    
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
        
//        let n1 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
//        let n2 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
//        let n3 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
//        let n4 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
//        let n5 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        
        var prevNumbers = [1,1,1,1,1]
        var resultNumbers = [1,1,1,1,1]
        
        switch countAttempt{
        case 1:
            let na = getRandomNumbers()
            
            prevNumbers = [na[0], na[1], na[2], na[3], na[4]]
            
            resultNumbers = prevNumbers
            print("resultNumbers1 : \(resultNumbers)")
            
            break
        case 2:
            let na = getRandomNumbers()
            
            let ScndResult = [prevNumbers[0], na[1], prevNumbers[2], na[3], na[4]]
            resultNumbers = ScndResult
            print("resultNumbers2 : \(resultNumbers)")
            break
        case 3:
            let na = getRandomNumbers()
            
            let ThirdResult = [prevNumbers[0], prevNumbers[1], prevNumbers[2], na[3], na[4]]
            resultNumbers = ThirdResult
            print("resultNumbers3 : \(resultNumbers)")
            break
        default:
            break
        }
        
        diceImageChange(var1: resultNumbers[0], var2: resultNumbers[1], var3: resultNumbers[2], var4: resultNumbers[3], var5: resultNumbers[4])

        
        //first one
        //let na = [n1, n2, n3, n4, n5]
        //print("na : \(na)")
        
//        let na2 = getRandomNumbers()
//        var tempA = [firstNumbers[0], na2[1], firstNumbers[2], na2[3], na2[4]]
//
//        print("temp : \(tempA)")
        
//        if(clickedFlag1){
//
//            print(tempA)
//
//        }
        
//        diceImageChange(var1: tempA[0], var2: tempA[1], var3: tempA[2], var4: tempA[3], var5: tempA[4])
        
        
        
//        if(clickedFlag1){ print(ma) }
//        let na = [n1, n2, n3, n4, n5]
//        print(na)
        
        
        //let result = [n1, n2, n3, n4, n5] //dices to display
        
        //display dices
//        diceImageChange(var1: n1, var2: n2, var3: n3, var4: n4, var5: n5)

        //print(ma[0])
        
        //print("ma[0]: \(ma[0])")
        
        
        count.text = "Attempt : "
        count.text = (count.text ?? "") +  String(countAttempt)
        
        countAttempt = countAttempt + 1
        
        if(countAttempt > 3){ countAttempt = 1 }
        
    }
    
    func getRandomNumbers() -> Array<Int>{
        let n1 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n2 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n3 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n4 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n5 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        
        let resultArray = [n1, n2, n3, n4, n5]
        
        return resultArray
    }
    
    func diceImageChange(var1:Int, var2:Int, var3:Int, var4:Int, var5:Int){
        
        let diceImageArray = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")]
        
        diceView1.image = diceImageArray[var1-1]
        //diceView1.image = diceImageArray.randomElement() // also randomize among indexes..
        diceView2.image = diceImageArray[var2-1]
        diceView3.image = diceImageArray[var3-1]
        diceView4.image = diceImageArray[var4-1]
        diceView5.image = diceImageArray[var5-1]
        
    }
    
    @objc func imageTapped1(sender: UITapGestureRecognizer){
        if(clickedFlag1){ //Dice has NOT been selected
            clickedFlag1 = false
            diceView1.backgroundColor = UIColor.green.withAlphaComponent(0.0)
            print(1)
        }
        else if(!clickedFlag1){ //Dice has been selected
            clickedFlag1 = true
            diceView1.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            print(2)
        }
//        print("tapped 1")
    }
    @objc func imageTapped2(sender: UITapGestureRecognizer){
        if(clickedFlag2){
            clickedFlag2 = false
            diceView2.backgroundColor = UIColor.green.withAlphaComponent(0.0)
        }
        else if(!clickedFlag2){
            clickedFlag2 = true
            diceView2.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
//        print("tapped 2")
    }
    @objc func imageTapped3(sender: UITapGestureRecognizer){
        if(clickedFlag3){
            clickedFlag3 = false
            diceView3.backgroundColor = UIColor.green.withAlphaComponent(0.0)
        }
        else if(!clickedFlag3){
            clickedFlag3 = true
            diceView3.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
//        print("tapped 3")
    }
    @objc func imageTapped4(sender: UITapGestureRecognizer){
        if(clickedFlag4){
            clickedFlag4 = false
            diceView4.backgroundColor = UIColor.green.withAlphaComponent(0.0)
        }
        else if(!clickedFlag4){
            clickedFlag4 = true
            diceView4.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
//        print("tapped 4")
    }
    @objc func imageTapped5(sender: UITapGestureRecognizer){
        if(clickedFlag5){
            clickedFlag5 = false
            diceView5.backgroundColor = UIColor.green.withAlphaComponent(0.0)
        }
        else if(!clickedFlag5){
            clickedFlag5 = true
            diceView5.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
//        print("tapped 5")
    }
    

}

