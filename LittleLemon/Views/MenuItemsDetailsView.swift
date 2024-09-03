//
//  MenuItemsDetailsView.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import SwiftUI

struct MenuItemsDetailsView: View {
    let item: MenuItem
    var body: some View {
        
        VStack (spacing: 10) {
            Image("Little Lemon logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            Text("Price:").bold()
            Text("\(item.priceInt)")
            
            Text("Ordered:").bold()
            Text("\(item.orders)")
            
            Text("Ingredients").bold()
            ForEach(item.ingredients, id: \.self) { ingredient in
            
                Text(ingredient.rawValue.capitalized)
            }
        }
        .navigationTitle(item.title.capitalized)
    }
    
}

#Preview {
    
    NavigationStack {
        MenuItemsDetailsView(item: MenuItem(title: "Ice Cream Sundae", category: .dessert, ingredients: [.broccoli, .carrot, .spinach], priceDouble: 4.99, orders: 20, priceInt: 499))
    }
}
