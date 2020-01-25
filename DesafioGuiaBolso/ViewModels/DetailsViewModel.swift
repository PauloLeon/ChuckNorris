//
//  DetailsViewModel.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class DetailsViewModel {
    
    var joke: BehaviorRelay<Joke> = BehaviorRelay(value: Joke())
    
    let kErrorText = "ops! without Funny, no jokes here"
    let kErrorURL = "error URL"

    func getJoke(category: String) {
        let api = ChuckNorrisManager()
        api.getJoke(category: category,successHandler: { (value) in
            self.joke.accept(value)
        }, errorHandler: { (error) in
            print(error)
        })
    }
    
    func getImageJoke() -> String {
        guard let jokeURLIcon = joke.value.iconURL else {
            return kErrorText
        }
        return jokeURLIcon
    }
    
    func getTextJoke() -> String {
        guard let jokeString = joke.value.value else {
            return kErrorText
        }
        return jokeString
    }
    
    func getUrlJoke() -> String {
        guard let jokeURL = joke.value.url else {
            return kErrorText
        }
        return jokeURL
    }
    
    
}
