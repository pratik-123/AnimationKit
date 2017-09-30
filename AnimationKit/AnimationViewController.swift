//
//  AnimationViewController.swift
//  AnimationKit
//
//  Created by Pratik Lad on 30/09/17.
//  Copyright © 2017 Pratik Lad. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation Kit"
    }

    @IBAction func buttonHandlerZoomIn(_ sender: UIButton) {
        
        sender.zoomAnimation(withDuration: 1.0, withZoomLevel: 0.5, complition: nil)
    }
    
    @IBAction func buttonHandlerZoomOut(_ sender: UIButton) {
        sender.zoomAnimation(withDuration: 1.0, withZoomLevel: 1.5 ,complition: {_ in
            print("zoom complition")
        })
    }
    
    @IBAction func buttonHandlerRepetRoted(_ sender: UIButton) {
        sender.rotedAnimation(withDuration: 0.3, withAngle: CGFloat(Double.pi), withRepetation: true, complition: nil)
    }
    @IBAction func buttonHandlerRoted(_ sender: UIButton) {
        sender.rotedAnimation(withDuration: 0.3, withAngle: CGFloat(Double.pi), withRepetation: false, complition: nil)
    }
    @IBAction func buttonHandlerMoveX(_ sender: UIButton) {
        sender.moveAnimation(withDuration: 0.5, withAxis: .x,withAnimStepCount: 30, complition: nil)
    }
    
    @IBAction func buttonHandlerMoveY(_ sender: UIButton) {
        sender.moveAnimation(withDuration: 0.5, withAxis: .y,withAnimStepCount: 30, complition: nil)
    }
    
    @IBAction func buttonHandlerBounceX(_ sender: UIButton) {
        sender.bounceAnimation(withDuration: 1.0, withAxis: .x, withBounceStepCount: 10, withAxisStepCount: 20, complition: nil)
    }
    @IBAction func buttonHandlerBounceY(_ sender: UIButton) {
        sender.bounceAnimation(withDuration: 1.0, withAxis: .y, withBounceStepCount: 10, withAxisStepCount: 20, complition: nil)
    }
}
