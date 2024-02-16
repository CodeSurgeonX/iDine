//
//  ItemDetail.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    // Expect you will be getting environment object. Is it interoperable between UIKit and SwiftUI.
    // Risk of crashing, if not found. Dangerous to use carelessly
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                //SwiftUI likes to display image in their natural size and this is very large image for pro max types devices thats why it is hanging of the screen, if we notice this in smaller device we would note credits are cut
                Image(item.mainImage)
                    .resizable() //Asks the system to resize it if needed
                    .scaledToFit() // Keep its natural ratio
                Text("Photo is by \(item.photoCredit)")
                    .padding(4)
                    .background(.black) //First add the padding then add the background
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y:-5)
            }
            Text(item.description)
            
            
            Button("Order This") {
                order.add(item: self.item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        // Large menu titles should be reserved for main screen, everything else should be inline
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("iPhone 15 Pro") {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
