//
//  MenuItemViewModel.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import Foundation

let mockMenuItems: [MenuItem] = [
    // Food MenuItems
    MenuItem(title: "Food 4", category: .food, ingredients: [.tomatoSauce, .carrot, .pasta], priceDouble: 18.0, orders: 10, priceInt: 18),
    MenuItem(title: "Food 5", category: .food, ingredients: [.tomatoSauce], priceDouble: 10.0, orders: 10, priceInt: 10),
    MenuItem(title: "Food 6", category: .food, ingredients: [.tomatoSauce], priceDouble: 90.0, orders: 10, priceInt: 90),
    MenuItem(title: "Food 7", category: .food, ingredients: [.tomatoSauce, .spinach, .carrot], priceDouble: 20.0, orders: 10, priceInt: 20),
    MenuItem(title: "Food 1", category: .food, ingredients: [.tomatoSauce], priceDouble: 10.0, orders: 10, priceInt: 10),
    MenuItem(title: "Food 2", category: .food, ingredients: [.tomatoSauce, .pasta], priceDouble: 15.0, orders: 15, priceInt: 15),
    MenuItem(title: "Food 3", category: .food, ingredients: [.spinach, .broccoli], priceDouble: 25.0, orders: 20, priceInt: 25),
    MenuItem(title: "Food 8", category: .food, ingredients: [.tomatoSauce, .broccoli], priceDouble: 25.50, orders: 10, priceInt: 26),
    MenuItem(title: "Food 9", category: .food, ingredients: [.tomatoSauce], priceDouble: 10.0, orders: 10, priceInt: 10),
    MenuItem(title: "Food 10", category: .food, ingredients: [.spinach], priceDouble: 35.0, orders: 10, priceInt: 35),
    MenuItem(title: "Food 11", category: .food, ingredients: [.pasta], priceDouble: 45.0, orders: 10, priceInt: 45),
    MenuItem(title: "Food 12", category: .food, ingredients: [.carrot, .spinach], priceDouble: 75.0, orders: 10, priceInt: 75),

    // drinks MenuItems
    MenuItem(title: "Drinks 4", category: .drinks, ingredients: [], priceDouble: 18.0, orders: 0, priceInt: 18),
    MenuItem(title: "Drinks 5", category: .drinks, ingredients: [], priceDouble: 10.0, orders: 10, priceInt: 10),
    MenuItem(title: "Drinks 1", category: .drinks, ingredients: [], priceDouble: 10.0, orders: 0, priceInt: 10),
    MenuItem(title: "Drinks 2", category: .drinks, ingredients: [], priceDouble: 15.0, orders: 15, priceInt: 15),
    MenuItem(title: "Drinks 3", category: .drinks, ingredients: [], priceDouble: 10.0, orders: 20, priceInt: 10),
    MenuItem(title: "Drinks 6", category: .drinks, ingredients: [], priceDouble: 10.0, orders: 10, priceInt: 10),
    MenuItem(title: "Drinks 7", category: .drinks, ingredients: [], priceDouble: 20.0, orders: 10, priceInt: 20),
    MenuItem(title: "Drinks 8", category: .drinks, ingredients: [], priceDouble: 25.0, orders: 10, priceInt: 25),

    // Dessert MenuItems
    MenuItem(title: "Dessert 2", category: .dessert, ingredients: [], priceDouble: 15.0, orders: 15, priceInt: 15),
    MenuItem(title: "Dessert 3", category: .dessert, ingredients: [], priceDouble: 10.0, orders: 20, priceInt: 10),
    MenuItem(title: "Dessert 1", category: .dessert, ingredients: [], priceDouble: 10.0, orders: 0, priceInt: 10),
    MenuItem(title: "Dessert 4", category: .dessert, ingredients: [], priceDouble: 18.0, orders: 0, priceInt: 18)
]



class MenuViewViewModel: ObservableObject {
    
    
    
    @Published var items: [MenuItem] = mockMenuItems
    
    @Published var selectedCategories = MenuCategory.all
    @Published var selectedOrder = SortOrder.alphabetical
    
    
    var filteredItems: [MenuItem] {
        
        var itemList: [MenuItem] = []
        
        switch selectedCategories {
        case .all:
            itemList = items
        case .food:
            itemList = self.foodMenuItems
        case .drinks:
            itemList = self.drinksMenuItems
        case .dessert:
            itemList = self.dessertMenuItems
        }
        
        switch selectedOrder {
        case .mostPopular:
            itemList.sort { $0.orders > $1.orders}
        case .priceIncrease:
            itemList.sort { $0.priceInt < $1.priceInt}
        case .alphabetical:
            itemList.sort { $0.title.lowercased() < $1.title.lowercased()}
        }
        
        return itemList
        
        
    }
    
    var foodMenuItems: [MenuItem] {
        items.filter { $0.category == .food}
    }
    
    var drinksMenuItems: [MenuItem] {
        items.filter { $0.category == .drinks}
    }
    
    var dessertMenuItems: [MenuItem] {
        items.filter { $0.category == .dessert}
    }
    

    
    
}
