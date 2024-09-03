//
//  LittleLemonTests.swift
//  LittleLemonTests
//
//  Created by HUY TON on 3/9/24.
//

import XCTest
@testable import LittleLemon

final class LittleLemonTests: XCTestCase {

   
    let viewModel = MenuViewViewModel()
    
    func test_checkFoodTitle() {
        let foodTitle = viewModel.items[0].title
        XCTAssertEqual(foodTitle, "Food 4")
    }
    
    func test_checkIngredients() {
        let foodIngredients = viewModel.items[0].ingredients
        XCTAssertEqual(foodIngredients, [.tomatoSauce, .carrot, .pasta])
    }
}
