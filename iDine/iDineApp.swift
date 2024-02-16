//
//  iDineApp.swift
//  iDine
//
//  Created by Shashwat Kashyap on 15/02/24.
//

import SwiftUI

@main
struct iDineApp: App {
    // @State is for value types
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
