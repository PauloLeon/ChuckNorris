//
//  DetailsViewModelTests.swift
//  DesafioGuiaBolsoTests
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import XCTest
@testable import Desafio

class DetailsViewModelTests: XCTestCase {
    
    var viewModel: DetailsViewModel!
    var mockVC: MockDetailsViewController!

    override func setUp() {
        viewModel = DetailsViewModel()
        viewModel.api = MockChuckNorrisManagerAPI()
        mockVC = MockDetailsViewController(viewModel: viewModel)
    }

    override func tearDown() {
        viewModel = nil
        mockVC = nil
    }
    
    func testGetCategories() {
        mockVC.getJoke(category: "Categoria Mock")
        XCTAssertEqual(mockVC.viewModel.joke.value.id, "1")
    }
    
    func testgetURLJoke() {
        mockVC.getJoke(category: "Categoria Mock")
        XCTAssertEqual(mockVC.getUrlJoke(), "http://www.teste.com.br")
    }
    
    func testgetTextJoke() {
        mockVC.getJoke(category: "Categoria Mock")
        XCTAssertEqual(mockVC.getTextJoke(), "piada teste")
    }
    
    func testGetImageJoke() {
        mockVC.getJoke(category: "Categoria Mock")
        XCTAssertEqual(mockVC.getImageJoke(), "http://www.teste.com.br")
    }
    
    func testGetCategoriesError() {
        let mockErrorAPI = MockChuckNorrisManagerAPI()
        mockErrorAPI.successMode = false
        viewModel.api = mockErrorAPI
        mockVC.getJoke(category: "Categoria Mock")
        XCTAssertEqual(mockVC.viewModel.joke.value.id, nil)
    }
    
    func testgetURLJokeError() {
        XCTAssertEqual(mockVC.getUrlJoke(), viewModel.kErrorText)
    }
    
    func testgetTextJokeError() {
        XCTAssertEqual(mockVC.getTextJoke(), viewModel.kErrorText)
    }
    
    func testGetImageJokeError() {
        XCTAssertEqual(mockVC.getImageJoke(), viewModel.kErrorText)
    }
    
}
