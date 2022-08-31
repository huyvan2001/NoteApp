//
//  Note_AppApp.swift
//  Note App
//
//  Created by Lê Văn Huy on 29/08/2022.
//

import SwiftUI

@main
struct Note_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
               MainTabView()
            }
            .environmentObject(ObjectNoteModel())
        }
    }
}
