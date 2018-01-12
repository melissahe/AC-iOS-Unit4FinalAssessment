//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case numberOfFlips = "Number Of Flips"
    
    //Extra Credit
    case numberOfSpins = "Number Of Spins"
    case numberOfRotations = "Number Of Rotations"
    case duration = "Duration"
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

class SettingsViewController: UIViewController {
    
    var properties: [[AnimationProperty]] =
        [
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0.1, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0),
             AnimationProperty(name: .heightMultiplier, stepperMin: 0.1, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0)
            ],
            
            [AnimationProperty(name: .horizontalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0),
             AnimationProperty(name: .verticalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0)
            ],
            
            [AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0)],
            
            //Extra Credit
            [AnimationProperty(name: .numberOfSpins, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0),
             AnimationProperty(name: .numberOfRotations, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0),
             AnimationProperty(name: .duration, stepperMin: 0, stepperMax: 5.0, stepperIncrement: 0.1, startingStepperVal: 1.0)
            ]
    ]
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        
        tv.dataSource = self
        tv.delegate = self
        
        tv.isScrollEnabled = false
        
        tv.register(SettingsTableViewCell.self, forCellReuseIdentifier: "settingsCell")
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        setUpNavigationItems()
        layoutTableView()
    }
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setUpNavigationItems() {
        navigationItem.title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSettingsAnimation))
    }
    
    @objc func addSettingsAnimation() {
        
        let alertController = UIAlertController(title: "Add Setting", message: "Give your custom settings a name!", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name your settings here"
            textField.textAlignment = .center
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            let heightCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! SettingsTableViewCell
            let widthCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! SettingsTableViewCell
            let horizontalCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! SettingsTableViewCell
            let verticalCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as! SettingsTableViewCell
            let flipsCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as! SettingsTableViewCell
            let spinsCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as! SettingsTableViewCell
            let rotationsCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 3)) as! SettingsTableViewCell
            let durationCell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 3)) as! SettingsTableViewCell
            
            let animation = Animation(name: alertController.textFields![0].text!, widthMultiplier: CGFloat(widthCell.stepper.value), heightMultiplier: CGFloat(heightCell.stepper.value), horizontalOffset: CGFloat(horizontalCell.stepper.value), verticalOffset: CGFloat(verticalCell.stepper.value), numberOfFlips: Float(flipsCell.stepper.value), numberOfSpins: Float(spinsCell.stepper.value), numberOfRotations: Float(rotationsCell.stepper.value), duration: durationCell.stepper.value)
            
            AnimationDataModel.manager.addAnimation(fromSettings: animation)
        
            let completionAlertController = UIAlertController(title: "Wooooooww", message: "\"\(alertController.textFields![0].text!)???\"\n😂😂 That's a good name??? 😂😂", preferredStyle: .alert)
            
            completionAlertController.addAction(UIAlertAction(title: "smh why you gotta do dis 😭", style: .default, handler: nil))
            
            self.present(completionAlertController, animated: true, completion: nil)
        
        }))

        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
        
        cell.configureSelf(with: property)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Position Settings"
        case 3:
            return "😂 Extra Credit Settings 😂"
        default:
            return "Other Settings"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}











