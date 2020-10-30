//
//  CategoriesListViewController.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 30.10.2020.
//

import UIKit

class CategoriesListViewController: UIViewController {
    
    var output: CategoriesListViewOutput!
    
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
        
        setupTableView()
        registerCells()
        setupNavigationBar()
//        output.updateData()
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
        
    }
    
    private func setupNavigationBar() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func close() {
        output.closeButtonTapped()
    }
    
    private func cellName() -> String {
        return String(describing: CategoriesTableViewCell.self)
    }
    
    private func registerCells() {
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: cellName())
    }
    
}

extension CategoriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = output.numberOfCells()
        if number != 0 {activityIndicator.stopAnimating()}
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName()) as! CategoriesTableViewCell
        let item = output.cellItem(for: indexPath)
        cell.configure(with: item)
        return cell
    }
}

extension CategoriesListViewController: UITableViewDelegate {
    
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
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            self?.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
