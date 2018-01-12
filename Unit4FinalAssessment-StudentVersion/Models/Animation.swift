//
//  Animation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

struct Animation: Codable {
    let name: String
    let widthMultiplier: CGFloat
    let heightMultiplier: CGFloat
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat
    let numberOfFlips: Float
    
    //Extra Credit
    let numberOfSpins: Float
    let numberOfRotations: Float
    let duration: Double
    
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
        
        let animations: [CABasicAnimation] = [
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
        
        //Extra Credit
        //Number Of Spins
        if animation.numberOfSpins > 0 {
            
            let spinsAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
            
            spinsAnimation.fromValue = 0
            spinsAnimation.toValue = Float.pi * animation.numberOfSpins
            
            groupAnimation.animations?.append(spinsAnimation)
        }
        
        //Number Of Rotations
        if animation.numberOfRotations > 0 {
            
            let rotationsAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            
            rotationsAnimation.fromValue = 0
            rotationsAnimation.toValue = Float.pi * animation.numberOfRotations
            
            groupAnimation.animations?.append(rotationsAnimation)
        }
        
        //Duration
        groupAnimation.duration = animation.duration
        
        groupAnimation.autoreverses = true
        
        return groupAnimation
    }

}

