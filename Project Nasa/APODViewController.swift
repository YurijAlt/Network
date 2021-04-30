//
//  APODViewController.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

import UIKit
class APODViewController: UIViewController {
    var apppod: APOD!
    var titttle: String!
    
    //MARK: - IB Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    
    func fetchData() {
        
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=z0owduoN1oOCl08yr0r6xd1rTHCWRbFLz7TXkhFa") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.apppod = try JSONDecoder().decode(APOD.self, from: data)
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
        }
    
    
    
}


