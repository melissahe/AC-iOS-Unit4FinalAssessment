//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let animationView = AnimationView()
    
    var animationProperties: [Animation] = [] //load from file manager!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        
        setUpAnimationView()
        setUpPickerView()

    }
    
    func setUpAnimationView() {
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //should grab data source variable from filemanager!!!
    func setUpPickerView() {
        
        
    }
    
    func setUpPlayButton() {
        
    }
    
    func setUpPauseButton() {
        
    }
}
