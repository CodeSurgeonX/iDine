//
//  OrderView.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

// This will be showing the currrent order
struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(self.order.items) { item in
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price)")
                    }
                }
                
                
                Section {
                    NavigationLink("Place Order") {
                        Text("Check Out")
                    }
                }
                
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
