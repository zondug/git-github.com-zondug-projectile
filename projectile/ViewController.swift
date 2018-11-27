//
//  ViewController.swift
//  projectile
//
//  Created by Zondug Kim on 11/27/18.
//  Copyright © 2018 Zondug Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // sliders indicate angle
    @IBOutlet weak var sineSlider: UISlider!
    @IBOutlet weak var cosSlider: VerticalUISlider!
    @IBOutlet weak var currentAngleLabel: UILabel!
    
    @IBOutlet weak var sineTimesLabel: UILabel!
    @IBOutlet weak var sineAngleLabel: UILabel!
    @IBOutlet weak var cosTimesLabel: UILabel!
    @IBOutlet weak var cosAngleLabel: UILabel!
    @IBOutlet weak var circleview: CircleView!
    
    @IBAction func sliderValue(_ sender: UISlider) {
        let sliderCurrentValue = Int(sender.value)
        
        circleview.currentangle = CGFloat(sliderCurrentValue)
        
        currentAngleLabel.text = "\(sliderCurrentValue)"
        setNeedsFocusUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

/// Change UISlider vertically
/// This part of code is from "http://swiftnotions.com/2017/07/25/the-curious-case-of-the-vertical-slider/"
@IBDesignable open class VerticalUISlider: UISlider {

    override open func draw(_ rect: CGRect) {
        self.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
    }
}
