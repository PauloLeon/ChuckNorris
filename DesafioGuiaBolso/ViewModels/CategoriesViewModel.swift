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

protocol CategoriesViewModelProtocol: AnyObject {
    var categories: BehaviorRelay<Categories> { get }
    func getCategories()
    func setChosenCategory(row: Int)
    var api: ChuckNorrisManagerProtocol{ get set }
}

class CategoriesViewModel: CategoriesViewModelProtocol {
    
    var api: ChuckNorrisManagerProtocol = ChuckNorrisManagerAPI()
    var categories: BehaviorRelay<Categories> = BehaviorRelay(value: [])
    var chosenCategory = String.empty()
         
    func getCategories() {
        api.getCategories(successHandler: { (value) in
            self.categories.accept(value)
        }, errorHandler: { (error) in
            print(error)
        })
    }
        
    func setChosenCategory(row: Int) {
        chosenCategory = categories.value[row]
    }
    
}
