//
//  CategoriesViewModel.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class CategoriesViewModel {
    
    private let model  = "Teste de Model"
    private let modelNumberRows: Int = 3
    
    func configTableViewCell(cell: CategorieTableViewCell) {
        cell.categorieLabel.text = model
    }
    
    func configNumberOfRows() -> Int {
        return modelNumberRows
    }

}
