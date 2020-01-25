//
//  CategoriesViewModel.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesViewModel {
    
    let categories: BehaviorRelay<Categories> = BehaviorRelay(value: [])
        
    func configTableViewCell(cell: CategorieTableViewCell, categorie: String) {
        cell.categorieLabel.text = categorie
    }
 
    func getCategories() {
        let api = ChuckNorrisManager()
        api.getCategories(successHandler: { (value) in
            self.categories.accept(value)
        }, errorHandler: { (error) in
            print(error)
        })
    }
    
}
