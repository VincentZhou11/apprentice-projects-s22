//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct NewPostView: View {
    
    @StateObject var vm = NewPostViewModel()
    
//    @State var text = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextEditor(text: $vm.currentPostText)
                Button {
                    vm.makePost()
                } label: {
                    Text("Post")
                }
            }.navigationTitle("New Post").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.makePost()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView().bothColorSchemes()
    }
}
