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
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let tipAmounts = [10,15,20,25,0]
    let paymentTypes = [
        "Cash",
        "Credit Card",
        "iDine Points"
    ]
    
    
    var paymentPickerView: some View {
        VStack {
            // $ is signifying the binding instead of just the var, it is like a reference has been passed to picker and whenever use interacts with picker the value is set to this variable
            Picker("How do you want to pay", selection: $paymentType) {
                ForEach(paymentTypes, id:\.self) {
                    Text($0)
                }
            }
            
            // We are adding animation to the binding, so whenever a value changes.
            Toggle("Add iDine Loyalty Card", isOn: $addLoyaltyDetails.animation(.linear))
            if addLoyaltyDetails {
                TextField("Enter your iDine id", text: $loyaltyNumber)
                    .transition(.scale)
            }
        }
    }
    
    var tipView: some View {
        Picker("Percentage", selection: $tipAmount) {
            ForEach(tipAmounts, id: \.self) { Text("\($0)") }
        }
        .pickerStyle(.segmented)
    }
    
    var totalView: some View {
        Button(action: {
            print("Ordering now, please stay calm")
        }, label: {
            Text("Confirm Order")
        })
    }
    
    var finalAmount: String {
        let orderValue = Double(order.total)
        let tipValue = (orderValue * Double(tipAmount))/100
        // Ideally I would want to check the locale from device and accordingly get the country and then format it
        return (orderValue + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        // Form makes this look perfect compared to VSTack, might wanna read more around it on apple doc
        Form {
            // Used with list form and picker
            Section {
                paymentPickerView
            }
            
            Section("Add a tip") {
                tipView
            }
            
            Section("Total: \(self.finalAmount)") {
                totalView
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
