//
//  MockChuckNorrisManagerAPI.swift
//  DesafioGuiaBolsoTests
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import Foundation
@testable import Desafio

public class MockChuckNorrisManagerAPI: ChuckNorrisManagerProtocol {
    
    public var successMode = true
    
    public func getCategories(successHandler: @escaping ( _ sucess: Categories) ->(),
                             errorHandler: @escaping ( _ error:Error) ->()) {
        if successMode {
            successHandler(["categoria 01", "categoria 02"])
        } else {
            errorHandler(NetworkResponse.badRequest)
        }
        
     }
    
    public func getJoke(category: String,
                        successHandler: @escaping ( _ sucess: Joke) ->(),
                            errorHandler: @escaping ( _ error:Error) ->()) {
        
        var joke = Joke()
        joke.categories = ["categoria 01"]
        joke.id = "1"
        joke.value = "piada teste"
        joke.createdAt = "dia teste"
        joke.iconURL = "http://www.teste.com.br"
        joke.url = "http://www.teste.com.br"
        
        if successMode {
            successHandler(joke)
        } else {
            errorHandler(NetworkResponse.badRequest)
        }
       
    }

}



