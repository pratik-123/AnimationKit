//
//  AnimationKit.swift
//  AnimationKit
//
//  Created by Pratik Lad on 30/09/17.
//  Copyright © 2017 Pratik Lad. All rights reserved.
//

import UIKit

enum Axis {
    case x
    case y
    case both
}
extension UIView{
    func zoomAnimation(withDuration duration: Double, withZoomLevel zoomLevel: CGFloat, complition : ((Bool) -> Swift.Void)?)  {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: zoomLevel, y: zoomLevel)
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            },completion : {_ in
                complition?(true)
            })
        }
    }
    
    func rotedAnimation(withDuration duration: Double,withAngle angle : CGFloat,withRepetation isRepeat:Bool , complition : ((Bool) -> Swift.Void)?) {
        if isRepeat
        {
            UIView.animate(withDuration: duration, delay: 0.0, options: .repeat, animations: {
                self.transform = self.transform.rotated(by: angle)
            }) { _ in
                complition?(true)
            }
        }
        else
        {
            UIView.animate(withDuration: duration, animations: {
                self.transform = self.transform.rotated(by: angle)
            }, completion: {_ in
                complition?(true)
            })
        }
    }
    
    func moveAnimation(withDuration duration : Double,withAxis axis:Axis,withAnimStepCount step:CGFloat,complition : ((Bool) -> Swift.Void)?) {
        let oldFrame = self.frame
        UIView.animate(withDuration: duration, animations: {
            if axis == .both
            {
                self.frame.origin.x += step
                self.frame.origin.y += step
            }
            else if axis == .y
            {
                self.frame.origin.y += step
            }
            else
            {
                self.frame.origin.x += step
            }
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.frame = oldFrame
            }, completion: { _ in
                complition?(true)
            })
        }
    }
    
    func bounceAnimation(withDuration duration : Double,withAxis axis:Axis,withBounceStepCount step:Int,withAxisStepCount bounceStep : CGFloat ,complition : ((Bool) -> Swift.Void)?) {
        let oldFrame = self.frame
        UIView.animate(withDuration: duration/Double(step), animations: {
            if axis == .x
            {
                self.frame.origin.x  += bounceStep
            }
            else
            {
                self.frame.origin.y += bounceStep
            }
        }, completion: { _ in
            UIView.animate(withDuration: duration/Double(step), animations: {
                if axis == .x
                {
                    self.frame.origin.x -= (bounceStep * 2)
                }
                else
                {
                    self.frame.origin.y -= (bounceStep * 2)
                }
            },completion:{_ in
                complition?(true)
                UIView.animate(withDuration: duration/Double(step), animations: {
                    self.frame.origin.x = oldFrame.origin.x
                    self.frame.origin.y = oldFrame.origin.y
                    
                },completion:{_ in
                    complition?(true)})
            })
        })
    }
}

