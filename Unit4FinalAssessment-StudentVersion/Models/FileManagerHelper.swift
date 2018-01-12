//
//  FileManagerHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class FileManagerHelper {
    private init() {}
    static let manager = FileManagerHelper()
    
    private let filePathName = "animations.plist"
    
    private var animations: [[AnimationProperty]] = [
        []
    ]
    
}
