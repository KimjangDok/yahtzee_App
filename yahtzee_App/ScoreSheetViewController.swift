//
//  scoreSheetViewController.swift
//  yahtzee_App
//
//  Created by Kim Janghyun on 2023/04/12.
//

import UIKit

class ScoreSheetViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIImageView!
    
    
    let diceList = [6,6,5,5,5]
    
    var upper_bonus_flag = false
    var lower_bonus_flag = false
    
    var upperCountList = [Int]()
    
    var totalScore = 0
    
    var diceFlag1 = false
    var diceFlag2 = false
    var diceFlag3 = false
    var diceFlag4 = false
    var diceFlag5 = false
    var diceFlag6 = false
    
    var threekindFlag = false
    var fourKindFlag = false
    var fullHouseFlag = false
    var smallStraightFlag = false
    var largeStraightFlag = false
    var yahtzeeFlag = false
    var choiceFlag = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var delegate: MyDataSendingDelegateProtocol? = nil
        
        //if there is dicelist ... get it from main ViewController
        print(diceList)
        check_upper(scoreList:diceList)
        check_lower(scoreList:diceList)
        addUpperScore()
    }
    
    //check upper score
    func check_upper(scoreList:[Int]){
        var count1 = 0
        var count2 = 0
        var count3 = 0
        var count4 = 0
        var count5 = 0
        var count6 = 0
        
        for score in scoreList
        {
            if score == 1 {
                count1 += 1
                diceFlag1 = true
            }
            if score == 2 {
                count2 += 1
                diceFlag2 = true
            }
            if score == 3 {
                count3 += 1
                diceFlag3 = true
            }
            if score == 4 {
                count4 += 1
                diceFlag4 = true
            }
            if score == 5 {
                count5 += 1
                diceFlag5 = true
            }
            if score == 6 {
                count6 += 1
                diceFlag6 = true
            }
        }
        
        upperCountList = [count1, count2, count3, count4, count5, count6]
//        let upperList = [count1*1, count2*2, count3*3, count4*4, count5*5, count6*6]
//        print(upperList)
        
        return
    }
    
    //Check for upper bonus (is this necessary?)
    func check_upper_bonus(score:Int) -> Int{
        var upperScore = score
        
        if(score >= 63){
            upper_bonus_flag = true
            upperScore += 35
        }
        
        return upperScore
    }
    
    func check_lower(scoreList:[Int]){
        //Check if it is Small Straight
        if((diceFlag1&&diceFlag2&&diceFlag3&&diceFlag4) ||
           (diceFlag2&&diceFlag3&&diceFlag4&&diceFlag5) ||
           (diceFlag3&&diceFlag4&&diceFlag5&&diceFlag6)){
            smallStraightFlag = true
            print("Small Straight")
        }
        //Check if it is Large Straight
        if((diceFlag1&&diceFlag2&&diceFlag3&&diceFlag4&&diceFlag5) ||
           (diceFlag2&&diceFlag3&&diceFlag4&&diceFlag5&&diceFlag6)){
            largeStraightFlag = true
            print("Large Straight")
        }
        //Check if it is Full House
        if(upperCountList.contains(3) && upperCountList.contains(2)){
            fullHouseFlag = true
            print("Full House")
        }
        //Check if it is 3 of a kind
        if(upperCountList.contains(3)){
            threekindFlag = true
            print("3 of a kind")
        }
        //Check if it is 4 of a kind
        if(upperCountList.contains(4)){
            fourKindFlag = true
            print("4 of a kind")
        }
        //Check if it is yahtzee
        if(upperCountList.contains(5)){
            yahtzeeFlag = true
            print("YAHTZEEEE!!!!")
        }
    }
    
    //temp
    func checkFlags(){
        if(fullHouseFlag){ totalScore += 25 }     //Full House
        if(smallStraightFlag){ totalScore += 35 } //Small Straight
        if(largeStraightFlag){ totalScore += 40 } //Large Straight
        if(yahtzeeFlag){ totalScore += 50 }       //Yahtzee
    }
    
    //Upper Score
    func addUpperScore(){
        var dice_score = 0;
        var dice_all_score = 0;
        
        print(upperCountList)
        
        //for-in 用法 indexと値
        for (index,val) in upperCountList.enumerated() {
            print("dice number : " + String(index+1))
            if(val > 0){
                print("val : " + String(val))
                dice_score = val * (index + 1)
//                print("score1 : " + String(sc))
//                sc += val * (index + 1)
                
            }
            dice_all_score += dice_score
        }
        print("score2 : " + String(dice_all_score))
    }
    
    //Is this necessary? maybe need other function?
    func addLowerScore(score:Int){
        if(fullHouseFlag){ totalScore += 25 }     //Full House
        if(smallStraightFlag){ totalScore += 35 } //Small Straight
        if(largeStraightFlag){ totalScore += 40 } //Large Straight
        if(yahtzeeFlag){ totalScore += 50 }       //Yahtzee
        
        if(threekindFlag){ totalScore += score }  //3 of a Kind
        if(fourKindFlag){ totalScore += score }   //4 of a Kind
        if(choiceFlag){ totalScore += score }     //Choice
        
    }
    
    @objc func closeButtonTapped(sender: UITapGestureRecognizer){
        let i = 0;
        print("closeButtonTapped : \(i)")
    }
}
