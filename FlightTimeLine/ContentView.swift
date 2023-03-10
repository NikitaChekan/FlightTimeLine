//
//  ContentView.swift
//  FlightTimeLine
//
//  Created by Nikita Chekan on 18.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Home")
                }
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
