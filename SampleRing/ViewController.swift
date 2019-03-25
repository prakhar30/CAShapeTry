//
//  ViewController.swift
//  SampleRing
//
//  Created by Prakhar Tripathi on 25/03/19.
//  Copyright © 2019 Prakhar Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var circleView = TryCircleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircleView()
    }
    
    func addCircleView() {
        let circleWidth = CGFloat(300)
        let circleHeight = circleWidth
        circleView = TryCircleView(frame: CGRect(x: 0, y: 0, width: circleWidth, height: circleHeight))
        
        myView.addSubview(circleView)
        addOneLayer()
    }
    
    func addOneLayer() {
        let arc = UIBezierPath(arcCenter: CGPoint(x: circleView.frame.width / 2, y: circleView.frame.height / 2), radius: (circleView.frame.size.width / 2) - 20.0, startAngle: degreeToRadian(degree: -30), endAngle: degreeToRadian(degree: 210), clockwise: true)
        addBeizerPath(to: circleView, beizerPath: arc, color: UIColor.blue)
    }
    
    func addTwoLayers() {
        let newArc = UIBezierPath(arcCenter: CGPoint(x: circleView.frame.width / 2, y: circleView.frame.height / 2), radius: (circleView.frame.size.width / 2) - 20.0, startAngle: 0.0, endAngle: CGFloat(Double.pi / 2), clockwise: true)
        addBeizerPath(to: circleView, beizerPath: newArc, color: UIColor.yellow)
        
        let newArc2 = UIBezierPath(arcCenter: CGPoint(x: circleView.frame.width / 2, y: circleView.frame.height / 2), radius: (circleView.frame.size.width / 2) - 20.0, startAngle: CGFloat(Double.pi / 2 + 0.5), endAngle: CGFloat(Double.pi), clockwise: true)
        addBeizerPath(to: circleView, beizerPath: newArc2, color: UIColor.green)
    }
    
    func addBeizerPath(to: UIView, beizerPath: UIBezierPath, color: UIColor) {
        let path = CAShapeLayer()
        path.path = beizerPath.cgPath
        path.fillColor = UIColor.clear.cgColor
        path.strokeColor = color.cgColor
        path.lineWidth = 20.0
        path.strokeEnd = 1.0
        to.layer.addSublayer(path)
    }

    @IBAction func buttonAction(_ sender: Any) {
        removeTopLayers()
    }
    
    func removeTopLayers() {
        if let layers = circleView.layer.sublayers {
            for i in (1..<layers.count).reversed() {
                layers[i].removeFromSuperlayer()
            }
        }
    }
    
    func degreeToRadian(degree: Int) -> CGFloat {
        return CGFloat(Double(degree) * 0.0174533)
    }
    
}
