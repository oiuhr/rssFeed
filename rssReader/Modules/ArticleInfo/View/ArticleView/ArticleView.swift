//
//  ArticleView.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import UIKit
import SDWebImage

class ArticleView: UIScrollView {
    
    private let image: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    private let contentView: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Title"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let dateTimeLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.text = "Date"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let content: UILabel = {
        
        let label = UILabel()
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Content"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configure(with article: Article) {
        
        image.sd_setImage(with: URL(string: article.images[0] as String))
        titleLabel.text = article.title
        
        let index = article.pubDate.index(article.pubDate.endIndex, offsetBy: -9)
        let dateString = article.pubDate[..<index]
        dateTimeLabel.text = String(dateString)
        
        content.text = article.content
        
    }
    
    func setupUI() {
        
        addSubview(contentView)
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateTimeLabel)
        contentView.addSubview(content)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            dateTimeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateTimeLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateTimeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: dateTimeLabel.leadingAnchor),
            content.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor, constant: 30),
            content.trailingAnchor.constraint(equalTo: dateTimeLabel.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
        
    }
    
}
