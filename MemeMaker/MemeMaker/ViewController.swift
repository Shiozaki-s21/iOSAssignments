//
//  ViewController.swift
//  MemeMaker
//
//  Created by SubaruShiozaki on 2019-04-25.
//  Copyright © 2019 Kazuya Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topCaption: UILabel!
    @IBOutlet var bottomCaption: UILabel!
    @IBOutlet var topSegment: UISegmentedControl!
    @IBOutlet var bottomSegment: UISegmentedControl!

    @IBOutlet var shibaView: UIImageView!
    
    @IBOutlet var stackView: UIStackView!
    
    var topCaptionArray:[CaptionOption] = []
    var bottomCaptionArray:[CaptionOption] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        let glasses:CaptionOption = CaptionOption(captionEmoji: "🕶", captionSentence: "You know what's cool?")
        let exprosion:CaptionOption = CaptionOption(captionEmoji: "💥", captionSentence: "You know what makes me mad?")
        let hart:CaptionOption = CaptionOption(captionEmoji: "💕", captionSentence: "You know what I love?")
        let cat:CaptionOption = CaptionOption(captionEmoji: "😸", captionSentence: "Cat wearing hats")
        let dog:CaptionOption = CaptionOption(captionEmoji: "🐶", captionSentence: "Dogs carring logs")
        let monkey:CaptionOption = CaptionOption(captionEmoji: "🙊", captionSentence: "Monkey being funkey")
        
        topCaptionArray = [glasses, exprosion, hart]
        bottomCaptionArray = [cat, dog, monkey]
        
        topSegment.removeAllSegments()
        bottomSegment.removeAllSegments()
        
        for i in 0..<topCaptionArray.count {
            topSegment.insertSegment(withTitle: topCaptionArray[i].captionEmoji, at: i, animated: false)
            bottomSegment.insertSegment(withTitle: bottomCaptionArray[i].captionEmoji, at: i, animated: false)
        }
        topSegment.selectedSegmentIndex = 0
        bottomSegment.selectedSegmentIndex = 0
        
        tappedTopSegment(view)
        tappendBottomSegment(view)
    }

    
    
    
    @IBAction func tappedTopSegment(_ sender: Any) {
        let tappedNum = topSegment.selectedSegmentIndex
        topCaption.text = topCaptionArray[tappedNum].captionSentence
    }
    
    @IBAction func tappendBottomSegment(_ sender: Any) {
        let tappedNum = bottomSegment.selectedSegmentIndex
        bottomCaption.text = bottomCaptionArray[tappedNum].captionSentence
    }
}

