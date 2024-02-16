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
                            
                            // In order to show a new screen on selection of  a option, we need to add a navigation link, something similiar would be done on UIKit by listening to cell delegate for tap and then taking action accordingly after mapping cell to a particular item in data source
                            
                            NavigationLink(value: item) {
                                // The trouble is the navigation link is created every time and hence the item detail is also created every time, causing SwiftUI to do extra work than required
                                
                                
                                // Better way would be to associate item with the navigation link and then use navigation destination modifier / closure
                                
                                // Refactored to use this instead of the earlier specified way
                                ItemRow(item: item)
                            }
                        }
                    }

                }
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                ItemDetail(item: item) // This wont be creating view every time, just links create which are linked to a particular item which are mapped to a ItemDetail view using this closure and it can be called whenever needed
                
                //This is more efficient and simpler to work with?
            })
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
