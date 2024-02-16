//
//  CheckoutView.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    // Simple values and only for current view, always make private apple recommends
    @State private var paymentType = "Cash"
    
    let paymentTypes = [
        "Cash",
        "Credit Card",
        "iDine Points"
    ]
    
    var body: some View {
        VStack {
            Section {
                // $ is signifying the binding instead of just the var, it is like a reference has been passed to picker and whenever use interacts with picker the value is set to this variable
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(paymentTypes, id:\.self) { paymentType in
                        Text(paymentType)
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
