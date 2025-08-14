//
//  BlossomMovieApp.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 11/7/24.
//

import SwiftUI
import SwiftData

@main
struct BlossomMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}





