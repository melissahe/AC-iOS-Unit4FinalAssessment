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
    let numberOfFlips: Float //this would be the repeat times property for a flip animation
    
    //add other properties? - Extra Credit?
//    let duration: Double
//    let delay???

}

