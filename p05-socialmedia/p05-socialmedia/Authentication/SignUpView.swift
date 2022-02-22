//
//  SignInView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username = ""
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var acceptEula = false
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Email", text:$email)
                TextField("Name", text:$name)
                
            }
            Section("Username") {
                TextField("Username", text:$username)
            }
            Section("Password") {
                TextField("Password", text:$password)
                TextField("Confirm Password", text:$confirmPassword)
            }
            
            Toggle(isOn:$acceptEula) {
                Text("Agree to Terms of Service")
            }
            
            Button {
                
            } label: {
                Text("Sign Up")
            }
        }.navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().bothColorSchemes()
    }
}
