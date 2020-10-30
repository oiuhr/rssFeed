//
//  ArticleInfoViewController.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 29.10.2020.
//

import UIKit

class ArticleInfoViewController: UIViewController {
    
    var input: ArticleInfoViewInput!
    var output: ArticleInfoViewOutput!
    
    var scrollView: ArticleView = {
        
        let scrollView = ArticleView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
        
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with article: Article) {
        scrollView.configure(with: article)
        navigationItem.title = article.category.capitalized
    }
    
    func prepareUI() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func close() {
        output.closeButtonTapped()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified: view.backgroundColor = .white
        case .dark: view.backgroundColor = .black
        @unknown default:
            fatalError()
        }
        
        setupNavigationBar()
        prepareUI()
    }
    
}
