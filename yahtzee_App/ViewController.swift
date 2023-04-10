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
    
    let diceImageArray = [UIImage(imageLiteralResourceName: "diceOne_96"), UIImage(imageLiteralResourceName: "diceTwo_96"), UIImage(imageLiteralResourceName: "diceThree_96"), UIImage(imageLiteralResourceName: "diceFour_96"), UIImage(imageLiteralResourceName: "diceFive_96"), UIImage(imageLiteralResourceName: "diceSix_96")]
    
    var countAttempt = 1
    
    var clickedFlag1 = false
    var clickedFlag2 = false
    var clickedFlag3 = false
    var clickedFlag4 = false
    var clickedFlag5 = false
    
    var resultNumbers = [1,1,1,1,1]
    var hold = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        diceView1.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView2.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView3.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView4.image = UIImage(imageLiteralResourceName: "diceOne_96")
        diceView5.image = UIImage(imageLiteralResourceName: "diceOne_96")
        */
        
        // initialize function
        initFunction()
        
        // ClickListener of image
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
        
        
//        print(hold.startIndex) //0
//        print(hold.endIndex) //5
//        print("---------")
        
        //Decide whether dices to hold or not
        for i in hold.startIndex..<hold.endIndex {
            if(hold[i]){
//                print(" X ")
                continue
            }else{
                resultNumbers[i] = Int.random(in: 1...6)
                print(resultNumbers[i])
            }
        }
        
        // Changes dices image to current numbers
        diceImageChange(resultNumbers:resultNumbers)
        // Set scores to sheet
        recordScores(resultNumbers:resultNumbers)

        
        // Count attempt
        count.text = "Attempt : "
        count.text = (count.text ?? "") +  String(countAttempt)
        
        countAttempt = countAttempt + 1
        
        if(countAttempt > 3){ countAttempt = 1 }
        
    }
    
    func initFunction(){
        countAttempt = 1
        
    }
    
    //Get random number and returns as arrays
    func getRandomNumbers() -> Array<Int>{
        /*
        let n1 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n2 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n3 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n4 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        let n5 = Int.random(in: 1...6) // 1-6 random type 0-5 cause of index
        */
        
        //let n = Int.random(in: 1...6)
        
        let resultArray = [Int.random(in: 1...6),
                           Int.random(in: 1...6),
                           Int.random(in: 1...6),
                           Int.random(in: 1...6),
                           Int.random(in: 1...6)]
        
        return resultArray
    }
    
    //Get Dice image
    func diceImageChange(resultNumbers:[Int]){
        diceView1.image = diceImageArray[resultNumbers[0]-1]
        //diceView1.image = diceImageArray.randomElement() // also randomize among indexes..
        diceView2.image = diceImageArray[resultNumbers[1]-1]
        diceView3.image = diceImageArray[resultNumbers[2]-1]
        diceView4.image = diceImageArray[resultNumbers[3]-1]
        diceView5.image = diceImageArray[resultNumbers[4]-1]
    }
    
    //records scores at score sheet
    func recordScores(resultNumbers:[Int]){
        print(resultNumbers)
        
        
        //1
        //2
        //3
        //4
        //5
        //6
        //+35 Bonus (when 63 over)
        //Upper Total
        
        //3Kind
        //4Kind
        //Full House
        //Small Straight
        //Large Straight
        //Yahtzee
        //Chance
        //Lower Total
        
        //Total Score
    }
    
    @objc func imageTapped1(sender: UITapGestureRecognizer){
        if(clickedFlag1){ //Dice has NOT been selected
            clickedFlag1 = false
            diceView1.backgroundColor = UIColor.green.withAlphaComponent(0.0)
        }
        else if(!clickedFlag1){ //Dice has been selected
            clickedFlag1 = true
            diceView1.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        }
        print("clickedFlag1 : \(clickedFlag1)")
        hold[0] = clickedFlag1
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
        print("clickedFlag2 : \(clickedFlag2)")
        hold[1] = clickedFlag2
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
        print("clickedFlag3 : \(clickedFlag3)")
        hold[2] = clickedFlag3
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
        print("clickedFlag4 : \(clickedFlag4)")
        hold[3] = clickedFlag4
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
        print("clickedFlag5 : \(clickedFlag5)")
        hold[4] = clickedFlag5
    }
    
    @IBAction func scoreSheetPressed(_ sender: UIButton) {
        // Go to scoresheet display
        print("scoreSheetPressed")
    }
    
    @IBAction func leaderboardPressed(_ sender: UIButton) {
        // Go to leaderboard display
        print("leaderboardPressed")
    }
    

}

