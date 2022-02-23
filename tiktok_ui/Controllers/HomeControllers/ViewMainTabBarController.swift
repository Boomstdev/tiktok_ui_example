//
//  ViewMainTabBarController.swift
//  tiktok_ui
//
//  Created by BOICOMP21070028 on 18/2/2565 BE.
//

import UIKit

class ViewMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
        self.delegate = self
    }
}

extension ViewMainTabBarController: UITabBarControllerDelegate{
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item : \(item)")
        let tabBar = item.title
        if tabBar != "Home" {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            self.tabBar.standardAppearance = appearance
            self.tabBar.tintColor = .black
        }else{
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            self.tabBar.standardAppearance = appearance
            self.tabBar.tintColor = .white
        }
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
    }
}
