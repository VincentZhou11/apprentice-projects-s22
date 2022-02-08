//
//  ProfileSettings.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileSettings: View {
    @State var name: String = "App Team Carolina"
    @State var username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    
    let userPosts: [Post] = PostList.defaultPosts
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Username", text: $name)
            }
            Section("Username") {
                TextField("Username", text: $username)
            }
            Section("Photo") {
                Image(profileImageAddress).resizable().scaledToFit().clipShape(Circle())
                Button {
                    
                } label: {
                    Text("Change photo")
                }
            }
            Section {
                Button {
                    
                } label: {
                    Text("Confirm Changes")
                }
            }
        }.navigationTitle("Settings")
    }
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings().bothColorSchemes()
    }
}
