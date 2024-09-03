//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by HUY TON on 24/7/24.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    
    @StateObject var vm = MenuViewViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            
            MenuItemsView(vm: vm)

        }
    }
}
