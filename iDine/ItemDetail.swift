//
//  ItemDetail.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
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
            Spacer()
        }
        .navigationTitle(item.name)
        // Large menu titles should be reserved for main screen, everything else should be inline
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ItemDetailPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                ItemDetail(item: MenuItem.example)
                    .preferredColorScheme(.dark)
                    .previewInterfaceOrientation(.portrait)
                    .previewDisplayName("iPhone 15")
                    .previewDevice("iPhone 15 Pro")
                    .previewDevice(PreviewDevice(rawValue: "iPhone 15"))

            }
            
            
            NavigationStack {
                ItemDetail(item: MenuItem.example)
                    .preferredColorScheme(.light)
                    .previewInterfaceOrientation(.portrait)
                    .previewLayout(.device)
                    .previewDisplayName("iPhoneSE")
                    .previewDevice("iPhone SE (3rd generation)")
                    .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))

            }
        }
    }
}
