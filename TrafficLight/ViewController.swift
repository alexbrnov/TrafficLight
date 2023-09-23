//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexandr Baranov on 22.09.2023.
//

import UIKit

enum CurrentLight {
    case red
    case yellow
    case green
}

final class ViewController: UIViewController {
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var switchButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOff: CGFloat = 0.3
    private let lightIsOn: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
        switchButton.layer.cornerRadius = 6
    }
    
    @IBAction func switchButtonTapped() {
        switchButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
        }
    }
}

