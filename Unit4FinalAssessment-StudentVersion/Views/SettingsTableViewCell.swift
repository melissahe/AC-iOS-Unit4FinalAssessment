//
//  SettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    lazy var settingsNameLabel: UILabel = {
        let label = UILabel()
        
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var settingsValueLabel: UILabel = {
        let label = UILabel()
        
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()

        stepper.addTarget(self, action: #selector(changeSettingsValue(_:)), for: .valueChanged)
        
        return stepper
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configureSelf(with property: AnimationProperty) {
        settingsNameLabel.text = property.name.rawValue + ":"
        
        settingsValueLabel.text = property.startingStepperVal.description
        
        stepper.minimumValue = property.stepperMin
        stepper.maximumValue = property.stepperMax
        stepper.stepValue = property.stepperIncrement
        stepper.value = property.startingStepperVal
    }

    @objc func changeSettingsValue(_ sender: UIStepper) {
        settingsValueLabel.text = sender.value.description
    }
    
    private func commonInit() {
        setUpSettingsNameLabel()
        setUpStepper()
        setUpSettingsValueLabel()
    }
    
    //Constraints
    private func setUpSettingsNameLabel() {
        contentView.addSubview(settingsNameLabel)
        
        settingsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        settingsNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        settingsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        settingsNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func setUpStepper() {
        contentView.addSubview(stepper)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        stepper.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
 
    private func setUpSettingsValueLabel() {
        contentView.addSubview(settingsValueLabel)
        
        settingsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        settingsValueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        settingsValueLabel.leadingAnchor.constraint(equalTo: settingsNameLabel.trailingAnchor, constant: 5).isActive = true
        settingsValueLabel.trailingAnchor.constraint(equalTo: stepper.leadingAnchor, constant: -40).isActive = true
        settingsValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
}
