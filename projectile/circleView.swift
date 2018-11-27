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
    
    var currentangle: CGFloat = 0 {
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
        
        let width = self.bounds.width
        let height = self.bounds.height
        let center = width/2
        let strokeWidth: CGFloat = 1
        let radius: CGFloat = width/2 - 1
        
        let circlePath = UIBezierPath()
        circlePath.move(to: CGPoint(x: width-1, y: height/2))

//        inclease angle in range stride
        for angle in stride(from: 0.0, to: 360, by: 0.1) {
            let x = CGFloat(cos(angle)) * radius + center
            let y = CGFloat(sin(angle)) * radius + center
            circlePath.addLine(to: CGPoint(x: x, y: y))
        }

        let circle = CAShapeLayer()
        circle.path = circlePath.cgPath
        
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = UIColor.red.cgColor
        circle.lineWidth = strokeWidth
        
        layer.addSublayer(circle)
        
        let circlepointx = CGFloat(center + center * cos(CGFloat(currentangle)))
        let circlepointy = CGFloat(center + center * sin(CGFloat(currentangle)))
        
        let circlePointPath = UIBezierPath(
            arcCenter: CGPoint(x: circlepointx, y: circlepointy),
            radius: 1,
            startAngle: 0,
            endAngle: 2 * .pi ,
            clockwise: true)
        print(circlepointx, " ,", circlepointy)
        
        let circlepoint = CAShapeLayer()
        circlepoint.path = circlePointPath.cgPath
        
        circlepoint.fillColor = UIColor.red.cgColor
        circlepoint.strokeColor = UIColor.red.cgColor
        circlepoint.lineWidth = strokeWidth * 5
        
        layer.addSublayer(circlepoint)
        setNeedsDisplay()
    }
}
