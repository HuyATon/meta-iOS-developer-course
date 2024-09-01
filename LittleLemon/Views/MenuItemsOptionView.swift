//
//  MenuItemsOptionView.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import SwiftUI

enum SortOrder: String , CaseIterable {
    
    case mostPopular = "Most Popular"
    case priceIncrease = "Price $-$$$"
    case alphabetical = "A-Z"
}

struct MenuItemsOptionView: View {
    
    @Binding var selectedCategory: MenuCategory
    @Binding var sortOrder: SortOrder
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Filter").bold().font(.title)
            Form {
                Section("SELECTED CATEGORIES") {
                    Picker("Current selected", selection: $selectedCategory) {
                        ForEach(MenuCategory.allCases, id: \.self) { categoryCase in
                        
                            Text(categoryCase.rawValue.capitalized)
                                .tag(categoryCase)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
                
                Section("SORT-BY") {
                    Picker("Current selected", selection: $sortOrder) {
                        ForEach(SortOrder.allCases, id: \.self) { order in
                        
                            Text(order.rawValue.capitalized)
                                .tag(order)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
            }
            
        }
        .ignoresSafeArea()
        .padding()

    }
        
}

#Preview {
    
    @State var selectedCategory = MenuCategory.food
    @State var sortOrder = SortOrder.alphabetical
    
    return NavigationStack {
        MenuItemsOptionView(selectedCategory: $selectedCategory, sortOrder: $sortOrder)
    }
}
