//
//  ProfileView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileView: View {
    let name: String = "App Team Carolina"
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    
    let userPosts: [Post] = PostList.defaultPosts

    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Image(profileImageAddress).resizable().scaledToFit().clipShape(Circle()).frame(width: 65, height: 65)
                    VStack(alignment: .leading) {
                        Text(name).font(.title2)
                        Text("@\(username)").font(.subheadline)
                    }
                }
                
                Section() {
                    NavigationLink {
                        ProfileSettings()
                    } label: {
                        HStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    }
                }
            }.navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().bothColorSchemes()
    }
}
