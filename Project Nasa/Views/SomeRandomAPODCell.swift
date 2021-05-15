//
//  SomeRandomAPODCell.swift
//  Project Nasa
//
//  Created by Юрий Чекалюк on 02.05.2021.
//

import UIKit

class SomeRandomAPODCell: UITableViewCell {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    @IBOutlet weak var apodImage: APODImageView!
    
    //MARK: - Public Methods
    
    func configure(with apod: APOD) {
        titleLabel.text = "Название: \(apod.title ?? "Без названия")"
        dateLabel.text = "Дата снимка: \(apod.date ?? "Дата неизвестна")"
        explanationLabel.text = apod.explanation
        
        apodImage.fetchImage(from: apod.url ?? "")
    }
    
}
