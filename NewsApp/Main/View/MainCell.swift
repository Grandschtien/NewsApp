//
//  MainCell.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
    
    func configurate(arcticle: Article){
        headerLabel.text = arcticle.title
        newsLabel.text = arcticle.articleDescription
    }
}
