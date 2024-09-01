//
//  MenuItem.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import Foundation



protocol MenuItemProtocol {
    
    var id: UUID { get }
    var priceDouble: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    
    var orders: Int { get set }
    var priceInt: Int { get set }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: MenuItemProtocol, Identifiable {

    
    let id = UUID()
    let title: String
    let category: MenuCategory
    var ingredients: [Ingredient]
    var priceDouble: Double
    var orders: Int
    
    var priceInt: Int
}
