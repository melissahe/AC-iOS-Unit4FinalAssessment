//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

//create a settings delegate that the file manager helper conforms to, when the settings change, it should make the delegate update its saved array of animations
//in the view did load/appear of the animation view controller, it should grab the array from the file manager

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Height Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    case numberOfFlips = "Number Of Flips"
    
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

protocol SettingsViewControllerDelegate: class {
    func addAnimation(fromSettings animation: Animation)
}

class SettingsViewController: UIViewController {

    var delegate: SettingsViewControllerDelegate?
    
    var properties: [[AnimationProperty]] =
        [
            [AnimationProperty(name: .widthMultiplier, stepperMin: 0.1, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0),
             AnimationProperty(name: .heightMultiplier, stepperMin: 0.1, stepperMax: 2.0, stepperIncrement: 0.1, startingStepperVal: 1.0)
            ],
            [AnimationProperty(name: .horizontalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0), AnimationProperty(name: .verticalOffset, stepperMin: -100.0, stepperMax: 100.0, stepperIncrement: 20.0, startingStepperVal: 0.0)
            ],
            [AnimationProperty(name: .numberOfFlips, stepperMin: 0, stepperMax: 10.0, stepperIncrement: 1.0, startingStepperVal: 0.0)]
    ]
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self

        //I didn't register a cell with the table view here because I didn't need a cell with a reusable identifier - at least, not yet
        
        //check extra credit - 2 additional animations dimensions? - is that two extra settings?
            //possible settings - maybe duration and delay? - should be double
            //this would need to change my animation model
        
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
        //set up an alert that presents (should have title, text label, and options below; cancel on left, OK on right; completion handler of okay should trigger save using delegate), and takes in a name
        
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
            
            let animation = Animation(name: alertController.textFields![0].text!, widthMultiplier: CGFloat(widthCell.stepper.value), heightMultiplier: CGFloat(heightCell.stepper.value), horizontalOffset: CGFloat(horizontalCell.stepper.value), verticalOffset: CGFloat(verticalCell.stepper.value), numberOfFlips: Float(flipsCell.stepper.value))
            
            self.delegate?.addAnimation(fromSettings: animation)
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
        let cell = SettingsTableViewCell()
        
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
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //do some stuff that also enables you to save all the current settings - like a button or w/e
}











