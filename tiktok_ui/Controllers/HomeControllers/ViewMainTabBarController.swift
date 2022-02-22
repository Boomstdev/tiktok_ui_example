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
    }


}
