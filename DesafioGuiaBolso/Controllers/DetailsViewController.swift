//
//  DetailsViewController.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Variables
    
    var titleNav: String?
    
    // MARK: - Constants

    let detailsViewModel = DetailsViewModel()

    // MARK: - override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsViewModel.getJoke()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
    }
    
    // MARK: - private methods
            
    private func setupNavigationBar() {
        guard let titleNavigation = titleNav else { return }
        title = titleNavigation
    }

}
