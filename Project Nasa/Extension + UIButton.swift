//
//  Extension + UIButton.swift
//  Project Nasa
//
//  Created by Юрий Чекалюк on 03.05.2021.
//

import UIKit


extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1000
        pulse.initialVelocity = 0.1
        pulse.damping = 0.2
        
        layer.add(pulse, forKey: nil)
        
    }
}
