//
//  NewsListViewControllerDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import UIKit

protocol NewsListViewDelegate: class {
    
    func getCategories(categories: [String])
    
}

protocol NewsListViewInput: class {
    
    func reloadTableView()
    
    func updateCell(with index: IndexPath)
    
}

protocol NewsListViewOutput: class {
    
    func selectCategories()
    
    func updateData(categories: [String])
    
    func downloadData()
    
    func numberOfCells() -> Int
    
    func cellItem(for indexPath: IndexPath) -> NewsCellItem
    
    func tappedCell(indexPath: IndexPath)
    
}
