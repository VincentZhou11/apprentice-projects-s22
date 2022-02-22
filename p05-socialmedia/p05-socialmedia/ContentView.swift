//
//  ContentView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeFeedView().tabItem {
                Label("Menu", systemImage: "house.fill")
            }
            NewPostView().tabItem {
                Label("New Post", systemImage: "plus.circle.fill")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().bothColorSchemes().previewInterfaceOrientation(.portrait)
    }
}
