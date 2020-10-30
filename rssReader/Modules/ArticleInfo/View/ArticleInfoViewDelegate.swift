//
//  ArticleInfoViewDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import Foundation

protocol ArticleInfoViewOutput: class {
    
    func closeButtonTapped()
    
}

protocol ArticleInfoViewInput: class {
    
    func configure(with article: Article)
}

