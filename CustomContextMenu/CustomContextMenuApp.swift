//
//  CustomContextMenuApp.swift
//  CustomContextMenu
//
//  Created by Michele Manniello on 21/07/21.
//

import SwiftUI

@main
struct CustomContextMenuApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
                Text("Ciao")
            }
        }
    }
}
