//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

//Observable Object is needed with order in-order to reload for any changes, we want this if we want to use it as @StateObject
class Order: ObservableObject {
    // @Published marks the properties which when changed a event would be fired to all observing entities, this is necessary to create the reactive pipeline
    @Published var items = [MenuItem]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
