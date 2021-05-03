//
//  ViewController.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var apodButton: UIButton!
    
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apodButton.pulsate()
        apodButton.alpha = 0.7
        textField.alpha = 0.7
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let someRandomApodTVC = segue.destination as? SomeRandomAPODTableVC else { return }
        someRandomApodTVC.fetchApods()
        let customURL = "https://api.nasa.gov/planetary/apod?count="+"\(textField.text ?? "")"+"&api_key=z0owduoN1oOCl08yr0r6xd1rTHCWRbFLz7TXkhFa"
        DataManager.shared.url = customURL
    }
    
}

//MARK: Keyboard settings
extension MainViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

