//
//  HomeFeedViewModel.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import Foundation

class HomeFeedViewModel: ObservableObject, Subscriber {
    func update() {
        fetchPosts()
    }
    
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
        PostServices.addSubscriber(subscriber: self)
    }
    func fetchPosts() {
        posts = PostServices.getHomeFeed()
    }
}
