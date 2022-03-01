//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    @StateObject var vm = HomeFeedViewModel()

    var body: some View {
        NavigationView {
//            List {
//                ForEach(vm.posts) { post in
//                    PostView(post: post)
//                }
//            }
//            .listStyle(.plain)
//            .navigationTitle("bluebird")
//        }
//        .onAppear(perform: {
//            vm.fetchPosts()
//        })
            ScrollView {
                ForEach(vm.posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.navigationBarHidden(true).overlay(alignment:.bottomTrailing) {
                NavigationLink {
                    NewPostView()
                } label: {
                    Circle().frame(width:50,height:50).padding().overlay {
                        Image(systemName: "plus").foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView().bothColorSchemes()
    }
}
