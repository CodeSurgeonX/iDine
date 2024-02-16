//
//  MainView.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                    // Please note the label view is a new view that we can use to add image and text in a nice alignmed way
                }
            
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}
