//
//  NewsListInteractorDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import Foundation

protocol NewsListInteractorInput: class {
    
    func getNews() -> ([Article], [String])

}
