//
//  scoreSheetViewController.swift
//  yahtzee_App
//
//  Created by Kim Janghyun on 2023/04/12.
//

import UIKit

class ScoreSheetViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Score")
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))

        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(tapGesture1)
    }

    
    @objc func closeButtonTapped(sender: UITapGestureRecognizer){
        let i = 0;
        print("closeButtonTapped : \(i)")
    }
}
