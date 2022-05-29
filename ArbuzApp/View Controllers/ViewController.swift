//
//  ViewController.swift
//  ArbuzApp
//
//  Created by Akniyet Turdybay on 28.05.2022.
//

import UIKit

class ViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTabBarController()
    }
    
    private func configureTabBarController(){
        self.tabBar.backgroundColor = .white
        self.tabBar.selectedImageTintColor = .systemGreen
        self.tabBar.unselectedItemTintColor = .label
        
        let productsVC = configureNavBar(vc: ProductsViewController(), image: "rectangle.and.text.magnifyingglass")
        let cartVC = configureNavBar(vc: CartViewController(), image: "cart")
        
        self.setViewControllers([productsVC, cartVC], animated: true)
    }

}

extension UITabBarController{
    func configureNavBar(vc: UIViewController, image: String) -> UINavigationController{
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = UIImage(systemName: image)
        return navController
    }
}

