//
//  ContentView.swift
//  iDine
//
//  Created by Shashwat Kashyap on 15/02/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    // Section Name - Generally we use header
                    
                    // This helps adds section in views like form, picker and list
                    Section(section.name) {
                        // Section Items
                        ForEach(section.items) { item  in
                            // Custom View, Very Fast
                            ItemRow(item: item)
                        }
                    }

                }
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}



// Identifiable : Identify which row is which
