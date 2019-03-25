//
//  CircleView.swift
//  SampleRing
//
//  Created by Prakhar Tripathi on 25/03/19.
//  Copyright © 2019 Prakhar Tripathi. All rights reserved.
//

import Foundation
import UIKit

class TryCircleView: UIView {
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width / 2) - 20.0, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.lineWidth = 20.0;
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 1.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCircle(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = 1.0
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }
    
}

class CircleView: UIView {
    
    let borderWidth: CGFloat = 20
    
    let startAngle = CGFloat(Double.pi)
    let middleAngle = CGFloat(Double.pi + (Double.pi / 2))
    let endAngle = CGFloat(2 * Double.pi)
    let superEndAngle = CGFloat(2.8 * Double.pi)
    var primaryColor = UIColor.red
    var secondaryColor = UIColor.blue
    var thirdColor = UIColor.lightGray
    var currentStrokeValue = CGFloat(0)
    var knownValue = 0
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = CGFloat(self.frame.width / 2 - borderWidth)
        let path1 = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: middleAngle, clockwise: true)
        let path2 = UIBezierPath(arcCenter: center, radius: radius, startAngle: middleAngle, endAngle: endAngle, clockwise: true)
        let path3 = UIBezierPath(arcCenter: center, radius: radius, startAngle: endAngle, endAngle: superEndAngle, clockwise: true)
        path1.lineWidth = borderWidth
        primaryColor.setStroke()
        path1.stroke()
        path2.lineWidth = borderWidth
        secondaryColor.setStroke()
        path2.stroke()
        thirdColor.setStroke()
        path3.lineWidth = borderWidth
        path3.stroke()
    }
}

