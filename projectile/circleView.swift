//
//  CircleView.swift
//  projectile
//
//  Created by Zondug Kim on 11/27/18.
//  Copyright © 2018 Zondug Kim. All rights reserved.
//

import UIKit

/// VC에 올라와 있는 사각형 뷰 전체에 대한 클래스
class CircleView: UIView {
    
    var currentangle: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Only override draw() if you perform custom drawing.
    /// An empty implementation adversely affects performance during animation.
    ///
    /// draw 안에서만 그려야 한다.
    override func draw(_ rect: CGRect) {
    
        drawcircles()

    }

    func drawcircles() {
        
        let center = self.bounds.width/2
        let strokeWidth: CGFloat = 1
        let radius: CGFloat =  center - (strokeWidth/2)
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: center, y: center),
            radius: radius,
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true)
        
        let circle = CAShapeLayer()
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = UIColor.red.cgColor
        circle.lineWidth = strokeWidth
        
        layer.addSublayer(circle)
        
        let circlepointx = CGFloat(center + center * cos(CGFloat(currentangle)))
        let circlepointy = CGFloat(center + center * sin(CGFloat(currentangle)))
        
        let circlepointstroke: CGFloat = 5
        
        let circlePointPath = UIBezierPath(
            arcCenter: CGPoint(x: circlepointx, y: circlepointy),
            radius: 1,
            startAngle: 0,
            endAngle: CGFloat(currentangle),
            clockwise: true)
        
        let circlepoint = CAShapeLayer()
        circlepoint.path = circlePointPath.cgPath
        
        circlepoint.fillColor = UIColor.red.cgColor
        circlepoint.strokeColor = UIColor.red.cgColor
        circlepoint.lineWidth = circlepointstroke
        
        layer.addSublayer(circlepoint)
        setNeedsDisplay()
    }
}
