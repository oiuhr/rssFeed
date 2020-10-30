//
//  Requester.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import Foundation

class Requester: NSObject, XMLParserDelegate {
    
    private var baseURL = "https://www.vesti.ru/vesti.rss"
    
    var articles: [Article] = []
    var categories: [String] = []
    
    private var tempArticle: Article? = nil
    private var tempElement: String?
    
    func fetchArticles () -> ([Article], [String]) {
        
        guard let url = URL(string: baseURL) else { return ([], []) }
        guard let parser = XMLParser(contentsOf: url) else { return ([], []) }
        
        parser.delegate = self
        parser.parse()
        
        return (articles, categories)
        
    }
    
    
    
    //MARK: - XMLParser Delegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        tempElement = elementName
        
        if elementName == "enclosure" {
            
            guard tempArticle != nil else { return }
            
            let attrsUrl = attributeDict as [String: NSString]
            guard let urlPic = attrsUrl["url"] else { return }
            tempArticle?.images.append(urlPic)
            
        }
        
        if elementName == "item" {
            
            tempArticle = Article(title: "", pubDate: "", content: "", category: "", images: [])
            
        }

        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        guard let article = tempArticle else { return }
        
        
        switch tempElement {
        case "title": tempArticle?.title = article.title+string
        case "pubDate": tempArticle?.pubDate = article.pubDate+string
        case "yandex:full-text": tempArticle?.content = article.content+string
        case "category": tempArticle?.category = article.category+string
        default: break
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            if let article = tempArticle {
                articles.append(article)
                if !categories.contains(article.category) {
                    categories.append(article.category)
                }
            }
            tempArticle = nil
        }
    }
    
    
}

