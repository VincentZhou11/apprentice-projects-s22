//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct NewPostView: View {
    
    @StateObject var vm = NewPostViewModel()
//    @ObservedObject var hvvm: HomeFeedViewModel = HomeFeedViewModel()
//    @State var text = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Characters: \(vm.currentPostText.count)") {
                TextEditor(text: $vm.currentPostText)
                Button {
                    vm.makePost()
                    dismiss()
                } label: {
                    Text("Post")
                }
            }
        }.navigationTitle("New Post").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    vm.makePost()
                    dismiss()
                } label: {
                    Image(systemName: "square.and.pencil")
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
