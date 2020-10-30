//
//  NewsListViewController.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import UIKit

class NewsListViewController: UIViewController {
    
    var output: NewsListViewOutput!
    
    private let refreshControl = UIRefreshControl()
    
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    lazy private var activityIndicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView(style: .large)
        tableView.backgroundView = indicator
        indicator.hidesWhenStopped = true
        
        return indicator
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigation()
        setupTableView()
        registerCells()
        output.downloadData()
        output.updateData(categories: [])
        
    }
    
    func setupNavigation() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(selectCategory))
        navigationItem.title = "Новости"
        
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        activityIndicator.startAnimating()
        refreshControl.addTarget(self, action: #selector(pullReload), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
    }
    
    private func cellName() -> String {
        return String(describing: NewsTableViewCell.self)
    }
    
    private func registerCells() {
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellName())
    }
    
    @objc func selectCategory() {
        output.selectCategories()
    }
    
    @objc func pullReload() {
        
        DispatchQueue.global(qos: .userInitiated).async{ [self] in
            output.downloadData()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            reloadTableView()
            refreshControl.endRefreshing()
        }
    }
    
}

extension NewsListViewController: NewsListViewInput {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func updateCell(with indexPath: IndexPath) {
        tableView.performBatchUpdates({
            tableView.reloadRows(at: [indexPath], with: .fade)
        }, completion: nil)
    }
    
}

//MARK: - Routing data messaging

extension NewsListViewController: NewsListViewDelegate {
    
    func getCategories(categories: [String]) {
        output.updateData(categories: categories)
    }
    
}

//MARK: - TableView Delegate

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number = output.numberOfCells()
        if number != 0 {activityIndicator.stopAnimating()}
        
        return number
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName()) as! NewsTableViewCell
        let item = output.cellItem(for: indexPath)
        cell.configure(with: item.title, date: item.date)
        
        return cell
        
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.tappedCell(indexPath: indexPath)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            self?.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
