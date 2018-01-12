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
    
    private let filePathName = "CustomAnimations.plist"
    
    //there should be a list of predefined animations and custom animations that start with the list of animations?
    private var defaultAnimations: [Animation] = [
    
        //to do - need to set up default values
        
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
    //data source variable in picker view
    func getAnimations() -> [Animation] {
        return defaultAnimations + customAnimations
    }
}

