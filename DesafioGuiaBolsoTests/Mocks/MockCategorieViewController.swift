//
//  MockCategorieViewController.swift
//  DesafioGuiaBolsoTests
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit
@testable import DesafioGuiaBolso


class MockCategorieViewController: UIViewController {
    private(set) var viewModel: CategoriesViewModelProtocol

    init(viewModel: CategoriesViewModelProtocol = CategoriesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func getCategories() {
        viewModel.getCategories()
    }

    @objc func setChosenCategory(row: Int = 1) {
        viewModel.setChosenCategory(row: row)
    }
}
