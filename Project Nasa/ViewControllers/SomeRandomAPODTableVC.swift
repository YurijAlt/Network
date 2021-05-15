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
    
    //MARK: - Private Properties
    private var spinnerView = UIActivityIndicatorView()
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.08629072458, green: 0.08615679294, blue: 0.09483363479, alpha: 1)
        spinnerView = showSpinner(in: tableView)
        fetchData(from: DataManager.shared.url)
        setupRefreshControl()
        
    }
    
    // MARK: Table view settings
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apods.count
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            apods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SomeRandomAPODCell
        let apod = apods[indexPath.row]
        cell.configure(with: apod)
        return cell
    }
    
    //MARK: - Private Methods
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.alamofireFetchData(from: url) { apods in
            self.apods = apods
            self.spinnerView.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        let myString = "Потяните вниз, чтобы увидеть другое изображение..."
        let myAttribute = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        refreshControl?.attributedTitle = myAttrString
        refreshControl?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshControl?.addTarget(self, action: #selector(downloadData), for: .valueChanged)
    }
    
    @objc private func downloadData() {
        fetchData(from: DataManager.shared.url)
        if self.refreshControl != nil {
            self.refreshControl?.endRefreshing()
        }
    }
    
    
}

