//
//  LeaderboardViewController.swift
//  yahtzee_App
//
//  Created by Kim Janghyun on 2023/04/12.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIImageView!
    @IBOutlet weak var leaderboardListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Leaderboard")
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(tapGesture1)
        
//        leaderboardListLabel.text = Main
    }
    
    @objc func closeButtonTapped(sender: UITapGestureRecognizer){
        let i = 0;
        print("closeButtonTapped : \(i)")
    }
}
