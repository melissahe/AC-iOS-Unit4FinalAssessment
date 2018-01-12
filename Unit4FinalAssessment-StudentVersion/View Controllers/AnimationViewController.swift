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
    
    var animations: [Animation] = []

    var currentAnimation = AnimationDataModel.manager.getAnimations()[0] {
        didSet {
            animationView.snowmanImageView.layer.removeAllAnimations()
            animationView.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        
        setUpAnimationView()
        setUpPickerView()
        setUpPlayButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    func setUpPickerView() {
        self.animations = AnimationDataModel.manager.getAnimations()
        
        animationView.animationPickerView.delegate = self
        animationView.animationPickerView.dataSource = self
    }
    
    //to do
    func setUpPlayButton() {
        animationView.playButton.addTarget(self, action: #selector(playButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func playButtonPressed(_ sender: UIButton) {
        print("play button pressed!!")
        
        //create animation
        let animation = Animation.generateAnimation(with: currentAnimation)
        
        animation.delegate = self
        
        //changing images
        if sender.imageView?.image == #imageLiteral(resourceName: "play") {
            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            self.animationView.snowmanImageView.layer.add(animation, forKey: nil)
        } else if sender.imageView?.image == #imageLiteral(resourceName: "pause") {
            sender.setImage(#imageLiteral(resourceName: "resume"), for: .normal)
        } else if sender.imageView?.image == #imageLiteral(resourceName: "resume") {
            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        }
        
    }
    
    //create start animation
    
    //create pause animation
    
    //create resume animation
    
}

extension AnimationViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedAnimation = animations[row]
        
        self.currentAnimation = selectedAnimation
    }
}

extension AnimationViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[row].name
    }
    
}

//got the idea for this from https://stackoverflow.com/questions/296967/animation-end-callback-for-calayer - to get a completion block after animation completes
extension AnimationViewController: CAAnimationDelegate {
    
    //resets button back to play image when animation is over
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.animationView.playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
    }
}
