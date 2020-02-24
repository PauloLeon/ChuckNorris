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

protocol DetailsViewModelProtocol: AnyObject {
    var joke: BehaviorRelay<Joke> { get }
    func getJoke(category: String)
    func getImageJoke() -> String
    func getTextJoke() -> String
    func getUrlJoke() -> String
    var api: ChuckNorrisManagerProtocol{ get set }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var joke: BehaviorRelay<Joke> = BehaviorRelay(value: Joke())
    var isLoadingFinish: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var api: ChuckNorrisManagerProtocol = ChuckNorrisManagerAPI()
    
    let kErrorText = "ops! without Funny, no jokes here"
    let kErrorURL = "error URL"

    func getJoke(category: String) {
        api.getJoke(category: category,successHandler: { (value) in
            self.joke.accept(value)
            self.isLoadingFinish.accept(true)
        }, errorHandler: { (error) in
            print(error)
            self.isLoadingFinish.accept(false)
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
