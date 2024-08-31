//
//  Github_Followers_SwiftuiApp.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

@main
struct Github_Followers_SwiftuiApp: App {
     
    init() {
        UITabBar.appearance().backgroundColor = .clear
        UITextField.appearance().tintColor = .label
    }
    
    var body: some Scene {
        WindowGroup {
            GFTabView()
        }
    }
}
