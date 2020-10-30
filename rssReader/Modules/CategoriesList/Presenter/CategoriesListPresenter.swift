//
//  CategoriesListPresenter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import Foundation

class CategoriesListPresenter {
    
    init(with categories: [String]) {
        
        self.categories = categories
        
    }
    
    private var categories: [String]
    private var selectedCategories: [String] = []
    
    weak var view: CategoriesListViewInput!
    var router: CategoriesListRouterInput!

}

extension CategoriesListPresenter: CategoriesListViewInput {
    
}

extension CategoriesListPresenter: CategoriesListViewOutput {
    
    func selectedCategory(with name: String) {
        return
    }
    
    func updateData() {
        return
    }
    
    func numberOfCells() -> Int {
        return categories.count
    }
    
    func cellItem(for indexPath: IndexPath) -> String {
        return categories[indexPath.row]
    }

    func tappedCell(indexPath: IndexPath) {
        selectedCategories.append(categories[indexPath.row])

    }
    
    func closeButtonTapped() {
        
        router.close(send: selectedCategories)
        
    }
    
}
