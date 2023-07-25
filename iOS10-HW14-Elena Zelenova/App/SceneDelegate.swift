//
//  SceneDelegate.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
             guard let windowScene = (scene as? UIWindowScene) else { return }
        let tabBarController = TabBarController.createTabBarController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

