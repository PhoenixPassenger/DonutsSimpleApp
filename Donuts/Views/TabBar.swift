//
//  TabBar.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .pinkDonut
        self.tabBar.unselectedItemTintColor = .purpleCream
        self.tabBar.barTintColor = .redDonut
        self.hideKeyboardWhenTappedAround()
        let tableVC = ViewController()
        tableVC.title = ("Toppings")
        let tableVCItem = UITabBarItem(title: "Toppings", image: UIImage(systemName: "star.fill"),
                                       selectedImage: UIImage(systemName: "star.fill"))
        tableVCItem.title = "Toppings"
        tableVC.tabBarItem = tableVCItem

        let tableNC = UINavigationController(rootViewController: tableVC)
        tableNC.navigationBar.tintColor = .purpleCream
        let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.pinkDonut]
            navBarAppearance.backgroundColor = .redDonut
        
        tableNC.navigationBar.standardAppearance = navBarAppearance
        tableNC.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.viewControllers = [tableNC]

    }

}
