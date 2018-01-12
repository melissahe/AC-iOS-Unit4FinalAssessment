//
//  Animation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//to set up - should be the data source variable for the picker view
//animations should always have autoreverse so they return to the center

//should have group animations - each using a part of these values - keypath will be decided in those values

struct Animation: Codable {
    let name: String
    let widthMultiplier: CGFloat
    let heightMultiplier: CGFloat
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat
    let numberOfFlips: Float
    
    //add other properties? - Extra Credit?
//    let duration: Double
//    let delay???
    
    static func generateAnimation(with animation: Animation) -> CAAnimationGroup {
        
        //Width
        let widthAnimation = CABasicAnimation(keyPath: "transform.scale.x")
        
        widthAnimation.fromValue = 1
        widthAnimation.toValue = animation.widthMultiplier
        widthAnimation.repeatCount = 0
        
        //Height
        let heightAnimation = CABasicAnimation(keyPath: "transform.scale.y")

        heightAnimation.fromValue = 1
        heightAnimation.toValue = animation.heightMultiplier
        heightAnimation.repeatCount = 0
        
        //Horizontal Offset
        let horizontalOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        
        horizontalOffsetAnimation.fromValue = 0
        horizontalOffsetAnimation.toValue = animation.horizontalOffset
        horizontalOffsetAnimation.repeatCount = 0
        
        //Vertical Offset
        let verticalOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        
        verticalOffsetAnimation.fromValue = 0
        verticalOffsetAnimation.toValue = animation.verticalOffset
        verticalOffsetAnimation.repeatCount = 0
        
        var animations: [CABasicAnimation] = [
            widthAnimation,
            heightAnimation,
            horizontalOffsetAnimation,
            verticalOffsetAnimation,
            ]
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = animations
        
        //Number Of Flips
        if animation.numberOfFlips > 0 {
            
            let flipsAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
            
            flipsAnimation.fromValue = 0
            flipsAnimation.toValue = Float.pi * animation.numberOfFlips
            
            groupAnimation.animations?.append(flipsAnimation)
        }
        
        //to do - extra credit
        groupAnimation.duration = 2.0
        //maybe delay?
        
        groupAnimation.autoreverses = true
        
        return groupAnimation
    }

}

