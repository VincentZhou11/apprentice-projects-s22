//
//  HomeFeedViewModel.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import Foundation

class HomeFeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    func fetchPosts() {
        posts = PostServices.getHomeFeed()
    }
}
