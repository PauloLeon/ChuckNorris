//
//  DetailsViewModel.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class DetailsViewModel {

    func getJoke() {
        let api = ChuckNorrisManager()
        api.getJoke(category: "science",successHandler: { (value) in
            print(value)
        }, errorHandler: { (error) in
            print(error)
        })
    }
}
