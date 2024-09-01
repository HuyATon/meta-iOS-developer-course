//
//  MenuItemsView.swift
//  LittleLemon
//
//  Created by HUY TON on 1/9/24.
//

import SwiftUI

struct MenuItemsView: View {
    
    @EnvironmentObject var vm: MenuViewViewModel
    
    @State var showConfig = false
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        
                        if category != .all {
                            Text(category.rawValue.capitalized)
                                .font(.title)
                        }
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                            ForEach(vm.filteredItems) { item in
                                
                                if item.category == category {
                                    NavigationLink {
                                        MenuItemsDetailsView(item: item)
                                    } label: {
                                        VStack {
                                            Rectangle()
                                                .aspectRatio(4/3, contentMode: .fill)
                                            Text("\(item.title)")
                                                .lineLimit(1)
                                        }
                                    }
                                    .tint(.black)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation {
                            showConfig.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $showConfig) {
                MenuItemsOptionView(selectedCategory: $vm.selectedCategories, sortOrder: $vm.selectedOrder)
            }
            
        }
        
    }
}

#Preview {
    MenuItemsView()
        .environmentObject(MenuViewViewModel())
        .fontDesign(.monospaced)
}
