//
//  DetailsViewController.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let categorieViewModel = CategoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
    }
            
    private func setupNavigationBar() {
        title = "receber do modelo"
    }

}
