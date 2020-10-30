//
//  SceneDelegate.swift
//  rssReader
//
//  Created by Ryzhov Eugene on 28.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        UINavigationBar.appearance().isTranslucent = false
        window?.rootViewController = UINavigationController(rootViewController: NewsListAssembly().newsListModule())
        window?.makeKeyAndVisible()
        
    }


}

