//
//  SomeRandomAPODTableVC.swift
//  Project Nasa
//
//  Created by Юрий Чекалюк on 02.05.2021.
//

import UIKit

class SomeRandomAPODTableVC: UITableViewController {
    
    //MARK: - Public Properties
    var apods: [APOD] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 800
        tableView.backgroundColor = #colorLiteral(red: 0.08629072458, green: 0.08615679294, blue: 0.09483363479, alpha: 1)
    }
    
    // MARK: Table view settings
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SomeRandomAPODCell
        let apod = apods[indexPath.row]
        cell.configure(with: apod)
        return cell
    }
    
    //MARK: - Networking
    func fetchApods() {
        guard let url = URL(string: DataManager.shared.url) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.apods = try JSONDecoder().decode([APOD].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
