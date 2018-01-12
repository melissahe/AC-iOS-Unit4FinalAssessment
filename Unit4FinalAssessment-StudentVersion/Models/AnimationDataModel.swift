//
//  AnimationDataModel.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum AnimationName: String {
    case Width, Height
    case horizontal = "Horizontal Position"
    case vertical = "Vertical Position"
    case rotationX = "Rotation-X"
    
}

class AnimationDataModel {
    private init() {}
    static let manager = AnimationDataModel()
    
    private let filePathName = "CustomAnimations.plist"
    
    var defaultAnimations: [Animation] = [
        //Width
        Animation(name: AnimationName.Width.rawValue, widthMultiplier: 2.0, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: 0, numberOfFlips: 0),
        //Height
        Animation(name: AnimationName.Height.rawValue, widthMultiplier: 1, heightMultiplier: 2.0, horizontalOffset: 0, verticalOffset: 0, numberOfFlips: 0),
        
        //Horizontal Position
        Animation(name: AnimationName.horizontal.rawValue, widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 100, verticalOffset: 0, numberOfFlips: 0),
        
        //Vertical Position
        Animation(name: AnimationName.vertical.rawValue, widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: -100, numberOfFlips: 0),
        
        //Rotation-X
        Animation(name: AnimationName.rotationX.rawValue, widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: 0, numberOfFlips: 1)
    ]
    
    private var customAnimations: [Animation] = [] //user added
    
    //documents directory
    private func documentsDirectory() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
        return urls[0]
    }
    
    //file path
    private func dataFilePath(fileName: String) -> URL {
        return documentsDirectory().appendingPathComponent(fileName)
    }
    
    //add
    func addAnimation(fromSettings animation: Animation) {
        self.customAnimations.append(animation)
        
        saveAnimations()
    }
    
    //save
    func saveAnimations() {
        let encoder = PropertyListEncoder()
        let filePath = dataFilePath(fileName: filePathName)
        
        do {
            let data = try encoder.encode(customAnimations)
            try data.write(to: filePath, options: .atomic)
            
            print("saved animations!")
        } catch {
            print(error.localizedDescription)
            print("😂 YA DUN GOOFED !! 😂")
        }
    }
    
    //load
    func loadAnimations() {
        let decoder = PropertyListDecoder()
        let filePath = dataFilePath(fileName: filePathName)
        
        do {
            let data = try Data(contentsOf: filePath)
            let savedAnimations = try decoder.decode([Animation].self, from: data)
            
            self.customAnimations = savedAnimations
            print("loaded animations!")
        } catch {
            print(error.localizedDescription)
            print("Wow.... smh 😒")
        }
    }
    
    //get
    func getAnimations() -> [Animation] {
        return defaultAnimations + customAnimations
    }
}

