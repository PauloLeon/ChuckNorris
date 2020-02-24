//
//  DetailsCoordinator.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 23/02/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class DetailsCoordinator: Coordinator {
  private let presenter: UINavigationController
    private var detailsViewController = DetailsViewController.instantiateViewController()
  var chosenCategory: String?

  init(presenter: UINavigationController, chosenCategory: String) {
    self.presenter = presenter
    self.chosenCategory = chosenCategory
  }

  func start() {
    detailsViewController.chosenCategory = chosenCategory
    presenter.pushViewController(detailsViewController, animated: true)
  }
    
}
