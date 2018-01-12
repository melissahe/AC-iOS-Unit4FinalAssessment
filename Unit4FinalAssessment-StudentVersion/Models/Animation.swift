//
//  Animation.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//to set up - should be the data source variable for the picker view

struct Animation: Codable {
    let widthMultiplier: CGFloat
    let heightMultiplier: CGFloat
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat
    let numberOfFlips: CGFloat //this would be the repeat times property
}

