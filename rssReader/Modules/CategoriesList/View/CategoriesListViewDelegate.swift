//
//  CategoriesListViewDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import UIKit

protocol CategoriesListViewInput: class {
    
    
    
}

protocol CategoriesListViewOutput: class {
    
    func selectedCategory(with name: String)
    
    func updateData()
    
    func numberOfCells() -> Int
    
    func cellItem(for indexPath: IndexPath) -> String
    
    func tappedCell(indexPath: IndexPath)
    
    func closeButtonTapped() 
    
}
