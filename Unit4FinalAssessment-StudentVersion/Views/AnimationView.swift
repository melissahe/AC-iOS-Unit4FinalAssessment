//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    lazy var snowmanImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "snowman")
        
        return imageView
    }()
    
    //set up data source variable for this somehow, settings must somehow (maybe through custom delegation) pass whatever user saves into 
    lazy var animationPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        
        //SET UP DELEGATE!! (in the view controller)
        
        return pickerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUpViews()
    }
    
    private func setUpViews() {
        setUpSnowmanImageView()
        setUpAnimationPickerView()
    }
    
    private func setUpSnowmanImageView() {
        addSubview(snowmanImageView)
        
        snowmanImageView.translatesAutoresizingMaskIntoConstraints = false
        
        snowmanImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        snowmanImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        snowmanImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        snowmanImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.60).isActive = true
    }
    
    private func setUpAnimationPickerView() {
        addSubview(animationPickerView)
        
        animationPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        animationPickerView.topAnchor.constraint(equalTo: snowmanImageView.bottomAnchor, constant: 16).isActive = true
        animationPickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        animationPickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        animationPickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
