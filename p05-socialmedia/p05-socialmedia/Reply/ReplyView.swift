//
//  ReplyView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct ReplyView: View {
    var post: Post
    @State var replyText = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    func reply() {
        let replyPost = Post(id: UUID(),
                           authorName: "Blue Bird",
                           authorUsername: "bluebird",
                           authorImageAddress: "bluebird",
                           datePosted: Date(),
                           postContent: replyText,
                           likeCount: 0,
                           commentCount: 0)
        PostServices.makeReply(post: post, replyPost: replyPost)
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {
//                (Text("Replying to ") + Text("@\(replyUsername)").foregroundColor(.blue)).padding(.leading, 20)
            Text("@\(post.authorUsername)").foregroundColor(.blue).font(.title2).padding(.leading, 20)
            Form {
                Section("Characters: \(replyText.count)") {
                    TextEditor(text: $replyText)
                    Button {
                        reply()
                        dismiss()
                    } label: {
                        Text("Post")
                    }
                }
            }
            
        }.navigationTitle("Replying to").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        reply()
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
        ReplyView(post: .example).bothColorSchemes()
    }
}
