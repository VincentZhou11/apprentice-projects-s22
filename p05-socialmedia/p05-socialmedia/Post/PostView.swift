//
//  PostView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    @State var liked = false

    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                HStack {
                    Image(post.authorImageAddress).resizable().scaledToFit().clipShape(Circle()).frame(width: 50, height: 50)
                    VStack(alignment:.leading) {
                        Text(post.authorName)
                        Text("@\(post.authorUsername)").font(.subheadline).foregroundColor(.secondary)
                    }
                    
                }
                Spacer()
                Text(post.formattedDate).font(.subheadline).foregroundColor(.secondary)
            }
            
            Text(post.postContent).padding([.top, .bottom]).fixedSize(horizontal: false, vertical: true)
            HStack {
                Button() {
                    liked.toggle()
                } label: {
                    HStack {
                        Image(systemName: "heart").foregroundColor(liked ? .red : .secondary)
                        Text("\(post.likeCount)").foregroundColor(liked ? .red : .secondary)
                    }
                }.buttonStyle(PlainButtonStyle())
                
                NavigationLink() {
                    ReplyView(replyUsername: post.authorUsername)
                } label: {
                    HStack {
                        Image(systemName: "bubble.left").foregroundColor(.secondary)
                        Text("\(post.commentCount)").foregroundColor(.secondary)
                    }
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .example)
            .bothColorSchemes()
    }
}
