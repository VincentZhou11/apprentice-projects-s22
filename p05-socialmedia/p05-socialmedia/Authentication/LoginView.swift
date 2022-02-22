//
//  LoginView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var remember = false
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text:$username)
                TextField("Password", text:$password)
                Toggle(isOn:$remember) {
                    Text("Save Login")
                }
            }
            Button {
                
            } label: {
                Text("Login")
            }
            
            Section("New User?") {
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Sign Up")
                }
            }
            
        }.navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().bothColorSchemes()
    }
}
