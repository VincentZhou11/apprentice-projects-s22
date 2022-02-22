//
//  PostServices.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import Foundation

protocol Subscriber {
    func update()
}


struct PostServices {
    private static var posts: [Post] = PostList.defaultPosts
    
    public static var subscribed: [Subscriber] = []
    static func getHomeFeed() -> [Post] {
        return posts
    }
    static func makePost(post: Post) {
        posts.insert(post, at:0)
        
        for subscriber in subscribed  {
            subscriber.update()
        }
    }
    static func addSubscriber(subscriber: Subscriber) {
        subscribed.append(subscriber)
    }
}
