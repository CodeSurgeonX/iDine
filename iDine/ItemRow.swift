//
//  ItemRow.swift
//  iDine
//
//  Created by Shashwat Kashyap on 16/02/24.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        // Tuple view is the return type by swift, in older version it wont show up in preview without the HStack, even appeared in tutorial
        
        // For me it worked without HStack even
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

#Preview {
    // It was not even building until we provided this example
    ItemRow(item: MenuItem.example)
}
