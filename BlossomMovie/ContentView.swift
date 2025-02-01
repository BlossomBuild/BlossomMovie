//
//  ContentView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 11/7/24.
//

import SwiftUI
 
struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString,systemImage: Constants.homeIconString){
                HomeView()
            }
            Tab(Constants.upcomingString,systemImage: Constants.upcomingIconString){
                Text(Constants.upcomingString)
            }
            Tab(Constants.searchString,systemImage: Constants.searchIconString){
                Text(Constants.searchString)
            }
            Tab(Constants.downloadString,systemImage: Constants.downloadIconString){
                Text(Constants.downloadString)
            }
        }

        .onAppear {
            if let config = APIConfig.shared {
                print(config.tmdbAPIKey)
                print(config.tmdbBaseURL)
            }
        }

    }
}

#Preview {
    ContentView()
}
