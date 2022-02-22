//
//  ReplyChainView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import SwiftUI

struct ReplyChainView: View {
    let post: Post
    
    var body: some View {
        VStack {
            
            
            ScrollView {
                
                PostView(post: post)
                
                ForEach(post.replies, id: \.id) { post in
                    PostView(post: post).padding(.leading, 20)
                }
            }.padding([.leading, .trailing]).overlay(alignment:.bottomTrailing) {
                NavigationLink {
                    ReplyView(post:post)
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
        ReplyChainView(post:.example)
    }
}
