//
//  CategoriesViewModelTests.swift
//  DesafioGuiaBolsoTests
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import XCTest
@testable import DesafioGuiaBolso

class CategoriesViewModelTests: XCTestCase {
    
    var viewModel: CategoriesViewModel!
    var mockVC: MockCategorieViewController!

    override func setUp() {
        viewModel = CategoriesViewModel()
        viewModel.api = MockChuckNorrisManagerAPI()
        mockVC = MockCategorieViewController(viewModel: viewModel)
    }

    override func tearDown() {
        viewModel = nil
        mockVC = nil
    }
    
    func testGetCategories() {
        mockVC.getCategories()
        XCTAssertTrue(mockVC.viewModel.categories.value != [])
    }
    
    func testChosenCategory() {
        mockVC.getCategories()
        mockVC.setChosenCategory()
        XCTAssertFalse(viewModel.chosenCategory.isEmpty)
    }

    func testGetCategoriesError() {
        let mockErrorAPI = MockChuckNorrisManagerAPI()
        mockErrorAPI.successMode = false
        viewModel.api = mockErrorAPI
        mockVC.getCategories()
        XCTAssertTrue(mockVC.viewModel.categories.value == [])
    }
        
}
