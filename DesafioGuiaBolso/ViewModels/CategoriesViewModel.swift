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
    private let modelNumberRows: Int = 3
    private let kZero: Int = 0
    
    
    func configTableViewCell(cell: CategorieTableViewCell, joke: String) {
        cell.categorieLabel.text = joke
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
