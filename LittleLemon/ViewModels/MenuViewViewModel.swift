//
//  MenuItemViewModel.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import Foundation

let mockMenuItems: [MenuItem] = [
    // Food MenuItems
    MenuItem(title: "Spaghetti Bolognese", category: .food, ingredients: [.pasta, .tomatoSauce], priceDouble: 12.99, orders: 15, priceInt: 1299),
    MenuItem(title: "Chicken Caesar Salad", category: .food, ingredients: [.spinach], priceDouble: 9.49, orders: 22, priceInt: 949),
    MenuItem(title: "Vegetable Stir Fry", category: .food,  ingredients: [.broccoli, .carrot], priceDouble: 10.25, orders: 18, priceInt: 1025),
    MenuItem(title: "Margherita Pizza", category: .food,  ingredients: [.tomatoSauce], priceDouble: 14.00, orders: 30, priceInt: 1400),
    MenuItem(title: "Beef Tacos", category: .food, ingredients: [.spinach], priceDouble: 11.75, orders: 25, priceInt: 1175),
    MenuItem(title: "Grilled Salmon", category: .food,  ingredients: [.broccoli], priceDouble: 18.50, orders: 10, priceInt: 1850),
    MenuItem(title: "Chicken Alfredo", category: .food,  ingredients: [.pasta, .spinach], priceDouble: 13.99, orders: 12, priceInt: 1399),
    MenuItem(title: "Veggie Burger", category: .food,  ingredients: [.spinach, .tomatoSauce], priceDouble: 9.99, orders: 17, priceInt: 999),
    MenuItem(title: "Grilled Cheese Sandwich", category: .food,  ingredients: [.spinach], priceDouble: 7.50, orders: 14, priceInt: 750),
    MenuItem(title: "BBQ Ribs", category: .food,  ingredients: [.tomatoSauce], priceDouble: 19.99, orders: 9, priceInt: 1999),
    MenuItem(title: "Shrimp Scampi", category: .food,  ingredients: [.pasta], priceDouble: 16.75, orders: 8, priceInt: 1675),
    MenuItem(title: "Beef Stroganoff", category: .food, ingredients: [.pasta], priceDouble: 14.99, orders: 13, priceInt: 1499),
    
    // Drink MenuItems
    MenuItem(title: "Coca-Cola", category: .drinks,  ingredients: [], priceDouble: 2.99, orders: 40, priceInt: 299),
    MenuItem(title: "Orange Juice", category: .drinks,  ingredients: [], priceDouble: 3.50, orders: 28, priceInt: 350),
    MenuItem(title: "Lemonade", category: .drinks, ingredients: [], priceDouble: 3.00, orders: 25, priceInt: 300),
    MenuItem(title: "Iced Tea", category: .drinks,  ingredients: [], priceDouble: 2.75, orders: 30, priceInt: 275),
    MenuItem(title: "Water", category: .drinks,  ingredients: [], priceDouble: 1.50, orders: 50, priceInt: 150),
    MenuItem(title: "Coffee", category: .drinks,  ingredients: [], priceDouble: 2.00, orders: 35, priceInt: 200),
    MenuItem(title: "Latte", category: .drinks,  ingredients: [], priceDouble: 4.25, orders: 22, priceInt: 425),
    MenuItem(title: "Hot Chocolate", category: .drinks,  ingredients: [], priceDouble: 3.75, orders: 18, priceInt: 375),
    
    // Dessert MenuItems
    MenuItem(title: "Chocolate Cake", category: .desert, ingredients: [], priceDouble: 6.50, orders: 15, priceInt: 650),
    MenuItem(title: "Cheesecake", category: .desert,ingredients: [], priceDouble: 7.00, orders: 12, priceInt: 700),
    MenuItem(title: "Apple Pie", category: .desert, ingredients: [], priceDouble: 5.75, orders: 10, priceInt: 575),
    MenuItem(title: "Ice Cream Sundae", category: .desert,  ingredients: [], priceDouble: 4.99, orders: 20, priceInt: 499)
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
        case .desert:
            itemList = self.desertMenuItems
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
    
    var desertMenuItems: [MenuItem] {
        items.filter { $0.category == .desert}
    }
    

    
    
}
