//
//  AboutViewController.swift
//  Project Nasa
//
//  Created by Юрий Чекалюк on 03.05.2021.
//

import UIKit

class AboutViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nasaLogo: UIImageView!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.08629072458, green: 0.08615679294, blue: 0.09483363479, alpha: 1)
        descriptionLabel.text = DataManager.shared.descriptionText
        descriptionLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nasaLogo.image = UIImage(named: DataManager.shared.nasaLogo)
    }
}
