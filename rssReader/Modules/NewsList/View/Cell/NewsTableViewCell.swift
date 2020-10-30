//
//  NewsTableViewCell.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let dateTimeLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .medium)
        
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
    
    func configure(with title: String, date: String) {
        titleLabel.text = title
        
        let index = date.index(date.endIndex, offsetBy: -9)
        let dateString = date[..<index]
        
        dateTimeLabel.text = String(dateString)
    }
    
    private func prepareUI() {
        
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateTimeLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            dateTimeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            dateTimeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
}
