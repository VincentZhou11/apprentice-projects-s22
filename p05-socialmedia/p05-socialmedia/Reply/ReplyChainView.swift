//
//  ReplyChainView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import SwiftUI

struct ReplyChainView: View {
    let parentPost: Post
    
    var body: some View {
        VStack {
            ScrollView {
                
                PostView(post: parentPost)
                Divider()
                Text("Replies").foregroundColor(.blue).font(.headline)
                Divider()
                ForEach(parentPost.replies, id: \.id) { post in
                    PostView(post: post, parentPost: parentPost).padding(.leading, 20)
                }
            }.padding([.leading, .trailing]).overlay(alignment:.bottomTrailing) {
                NavigationLink {
                    ReplyView(post:parentPost)
                } label: {
                    Circle().frame(width:50,height:50).padding().overlay {
                        Image(systemName: "plus").foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ReplyChainView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyChainView(parentPost:.example).bothColorSchemes()
    }
}
