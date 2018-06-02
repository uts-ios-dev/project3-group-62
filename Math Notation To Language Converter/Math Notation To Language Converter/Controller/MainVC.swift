//
//  ViewController.swift
//  Math Notation To Language Converter
//
//  Created by Peter Bower on 10/5/18.
//  Copyright © 2018 Summer Studios. All rights reserved.
//

import UIKit

enum AboutImgAnimation: Int {
    
    case style1 = 1
    case style2 = 2
    case style3 = 3
    case style4 = 4

    mutating func next() {
        if self == .style1 {
            self = .style2
        } else if self == .style2 {
            self = .style3
        } else if self == .style3 {
            self = .style4
        } else if self == .style4 {
            self = .style1
        }
    }
}


class MainVC: UIViewController {

    @IBOutlet weak var aboutImg: UIImageView!
    @IBOutlet weak var aboutImgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var style: AboutImgAnimation = .style1
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            self.aboutImg.animationImages = self.getAnimationFrames(animationStyle: style)
            self.aboutImg.animationDuration = 2        //setup the animation properties
            self.aboutImg.animationRepeatCount = 1
            self.aboutImg.startAnimating()
            style.next()
        }
    }
    
    func getAnimationFrames(animationStyle: AboutImgAnimation) -> [UIImage]? {
        let images: [UIImage]?
        switch animationStyle {
        case .style1:
            images = [        //create the array of images for the animation
                UIImage(named: "AS1-1.png"),
                UIImage(named: "AS1-2.png"),
                UIImage(named: "AS1-3.png"),
                UIImage(named: "AS1-4.png"),
                UIImage(named: "AS1-5.png"),
                UIImage(named: "AS1-6.png"),
                UIImage(named: "AS1-7.png"),
                UIImage(named: "AS1-8.png")
            ] as? [UIImage]
        case .style2:
            images = [
                UIImage(named: "AS2-1.png"),
                UIImage(named: "AS2-2.png"),
                UIImage(named: "AS2-3.png"),
                UIImage(named: "AS2-4.png"),
                UIImage(named: "AS2-5.png"),
                UIImage(named: "AS2-6.png"),
                UIImage(named: "AS2-7.png"),
                UIImage(named: "AS2-8.png")
            ] as? [UIImage]
        case .style3:
            images = [
                UIImage(named: "AS3-1.png"),
                UIImage(named: "AS3-2.png"),
                UIImage(named: "AS3-3.png"),
                UIImage(named: "AS3-4.png"),
                UIImage(named: "AS3-5.png"),
                UIImage(named: "AS3-6.png"),
                UIImage(named: "AS3-7.png"),
                UIImage(named: "AS3-8.png"),
                UIImage(named: "AS3-9.png"),
                UIImage(named: "AS3-10.png"),
                UIImage(named: "AS3-11.png"),
                UIImage(named: "AS3-12.png"),
                UIImage(named: "AS3-13.png"),
                UIImage(named: "AS3-14.png")
            ] as? [UIImage]
        case .style4:
            images = [
                UIImage(named: "AS4-1.png"),
                UIImage(named: "AS4-2.png"),
                UIImage(named: "AS4-3.png"),
                UIImage(named: "AS4-4.png"),
                UIImage(named: "AS4-5.png"),
                UIImage(named: "AS4-6.png"),
                UIImage(named: "AS4-7.png"),
                UIImage(named: "AS4-8.png"),
                UIImage(named: "AS4-9.png"),
                UIImage(named: "AS4-10.png"),
                UIImage(named: "AS4-11.png"),
                UIImage(named: "AS4-12.png"),
                UIImage(named: "AS4-13.png")
            ] as? [UIImage]
        }
        return images
    }
}

