//
//  ViewController.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
//MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let apodVC = segue.destination as? APODViewController else { return }
        apodVC.fetchData()
    }
    
    
//MARK: - IB Actions
    


//MARK: Private Methods


    
    
    
    
private func successAlert() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Success",
            message: "You can see the results in the Debug area",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
        
    }
}


}
//MARK: - Networking

//extension MainViewController {
//
//
//    private func viewAPOD() {
//        guard let url = URL(string: DataManager.URLExamples.apodImage.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let apod = try JSONDecoder().decode(APOD.self, from: data)
//                self.successAlert()
//            } catch let error {
//
//                print(error.localizedDescription)
//            }
//
//
//
//        }.resume()
//
//    }
//}
