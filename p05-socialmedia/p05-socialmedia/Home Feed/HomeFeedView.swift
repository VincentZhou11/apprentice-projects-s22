//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    
    @StateObject var vm = HomeFeedViewModel()
//    let posts: [Post] = PostList.defaultPosts
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.padding([.leading, .trailing]).navigationBarHidden(true).overlay(alignment:.bottomTrailing) {
                NavigationLink {
                    NewPostView()
                } label: {
                    Circle().frame(width:50,height:50).padding().overlay {
                        Image(systemName: "plus").foregroundColor(.white)
                    }
                }
            }
        }.onAppear {
            vm.fetchPosts()
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView().bothColorSchemes()
    }
}
