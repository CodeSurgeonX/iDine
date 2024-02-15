//
//  ItemRow.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green,
    ]
    
    var body: some View {
        // Tuple view is the return type by swift, in older version it wont show up in preview without the HStack, even appeared in tutorial
        
        // For me it worked without HStack even
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay {
                    // Adds circle around clipped image with some line width to make a nice boundary for styling
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                }
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
                    .font(.callout)
            }
            
            Spacer()
            
            // Use the string object itself for identifying, here we have strings.
            // Note it might not be able to seperate b/w two "S" and "S"
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    // It was not even building until we provided this example
    ItemRow(item: MenuItem.example)
}
