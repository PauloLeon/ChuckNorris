//
//  CategoriesCoordinator.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 23/02/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class CategoriesCoordinator: Coordinator {
  private let presenter: UINavigationController
  private var categoriesViewController = CategoriesViewController.instantiateViewController()
  private var detailsCoordinator: DetailsCoordinator?

  init(presenter: UINavigationController) {
    self.presenter = presenter
  }

  func start() {
     categoriesViewController.delegate = self
     presenter.pushViewController(categoriesViewController, animated: true)
  }
}

extension CategoriesCoordinator: CategoriesViewControllerDelegate {
  func CategoriesViewControllerDidSelectChosenCategory(_ chosenCategory: String) {
    let detailsCoordinator = DetailsCoordinator(presenter: presenter,
                                                        chosenCategory: chosenCategory)
    detailsCoordinator.start()
    self.detailsCoordinator = detailsCoordinator
  }
}
