//
//  CategoriesTableViewCell.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    private let categoryLabel: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: String) {
        categoryLabel.text = category.capitalized
    }
    
    private func setAccessory() {
        
        if (accessoryType == .none){
            accessoryType = .checkmark
        }  else {
            accessoryType = .none
        }
    }
    
    private func prepareUI() {
        
        accessoryType = .none
        
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
    
}
