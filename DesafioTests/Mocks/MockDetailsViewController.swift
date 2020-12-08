//
//  MOckDetailsViewController.swift
//  DesafioGuiaBolsoTests
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation
import UIKit
@testable import Desafio


class MockDetailsViewController: UIViewController {
    private(set) var viewModel: DetailsViewModelProtocol

    init(viewModel: DetailsViewModelProtocol = DetailsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func getJoke(category: String) {
        viewModel.getJoke(category: category)
    }

    @objc func getImageJoke() -> String {
        return viewModel.getImageJoke()
    }
    
    @objc func getTextJoke() -> String {
        return viewModel.getTextJoke()
    }

    @objc func getUrlJoke() -> String {
        return viewModel.getUrlJoke()
    }
}
