//
//  ReplyView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct ReplyView: View {
    let replyUsername: String
    @State var reply = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {
//                (Text("Replying to ") + Text("@\(replyUsername)").foregroundColor(.blue)).padding(.leading, 20)
            Text("@\(replyUsername)").foregroundColor(.blue).font(.title2).padding(.leading, 20)
            Form {
                Section("Characters: \(reply.count)") {
                    TextEditor(text: $reply)
                    Button {
                        dismiss()
                    } label: {
                        Text("Post")
                    }
                }
            }
            
        }.navigationTitle("Replying to").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
    }
}

struct ReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyView(replyUsername: "exampleuser").bothColorSchemes()
    }
}
