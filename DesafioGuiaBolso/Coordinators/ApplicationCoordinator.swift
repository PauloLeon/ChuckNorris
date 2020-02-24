//
//  ApplicationCoordinator.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 23/02/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
  let window: UIWindow
  let rootViewController: UINavigationController
  let categoriesCoordinator: CategoriesCoordinator

  
  init(window: UIWindow) {
    self.window = window
    rootViewController = UINavigationController()
    rootViewController.navigationBar.barTintColor = UIColor.getNavColor()    
    categoriesCoordinator = CategoriesCoordinator(presenter: rootViewController)
  }
  
  func start() {
    window.rootViewController = rootViewController
    categoriesCoordinator.start()
    window.makeKeyAndVisible()
  }
}
