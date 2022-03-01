//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct NewPostView: View {
    @StateObject var vm = NewPostViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $vm.currentText)

                    if vm.currentText.isEmpty {
                        Text("What's happening?")
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
            }
            .cornerRadius(10)
            .padding()
            .navigationTitle("Create Post")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        vm.makePost()
                    }
                }
            }
//    @State var text = ""
//
//    var body: some View {
//        VStack(alignment:.leading) {
//            Text("New Post")
//            TextField("Reply", text: $text)
//        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView().bothColorSchemes()
    }
}
