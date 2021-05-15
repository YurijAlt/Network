//
//  ViewController.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var apodButton: UIButton!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = ""
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        
        apodButton.pulsate()
        apodButton.alpha = 0.7
    }
    
}
