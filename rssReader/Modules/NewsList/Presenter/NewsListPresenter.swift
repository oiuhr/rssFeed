//
//  NewsListPresenter.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import Foundation

class NewsListPresenter {
    
    private var articles: [Article] = []
    private var categories: [String] = []
    private var selectedCategories: [String] = []
    private var sortedArticles: [Article] = []
    
    var interactor: NewsListInteractorInput!
    weak var view: NewsListViewInput!
    var router: NewsListRouter!
    
    private func reloadTableView() {
        guard !selectedCategories.isEmpty else {
            sortedArticles = articles
            return
        }
        sortedArticles = articles.filter({
            return selectedCategories.contains($0.category)
        })
        DispatchQueue.main.async {
            self.view.reloadTableView()
        }
    }
    
}

extension NewsListPresenter {
    
    func getFromDismiss(selectedCategories: [String]) {
        self.categories = selectedCategories
        reloadTableView()
    }
    
}

extension NewsListPresenter: NewsListViewOutput {

    func downloadData() {
        (articles, categories) = interactor.getNews()
    }
    
    func selectCategories() {
        router.openCategories(categories: categories)
    }
    
    func updateData(categories: [String]) {
        selectedCategories = categories
        reloadTableView()
    }
    
    func numberOfCells() -> Int {
        return sortedArticles.count
    }
    
    func cellItem(for indexPath: IndexPath) -> NewsCellItem {
        let article = sortedArticles[indexPath.row]
        let title = article.title
        let date = article.pubDate
        let item = NewsCellItem(title: title, date: date)
        
        return item
    }

    func tappedCell(indexPath: IndexPath) {
        let item = sortedArticles[indexPath.row]
        router.openArticle(article: item)
    }
    
}
