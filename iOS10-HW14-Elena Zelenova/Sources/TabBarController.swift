//
//  TabBarController.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    static func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(
            [
                createViewController(controller: LibraryViewController(), title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0),
                createViewController(controller: ForYouViewController(), title: "Для Вас", image: UIImage(systemName: "heart.text.square"), tag: 1),
                createViewController(controller: AlbumsViewController(), title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2),
                createViewController(controller: SearchViewController(), title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
            ],
            animated: true
        )
        
        tabBarController.selectedIndex = 2
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.isTranslucent = true
        
        return tabBarController
    }
    
    private static func createViewController(controller: UIViewController, title: String, image: UIImage?, tag: Int) -> UIViewController {
        let viewController = controller
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        viewController.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.isTranslucent = true
        
        return navigationController
    }
}
