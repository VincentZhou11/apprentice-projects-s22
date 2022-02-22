//
//  PostServices.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import Foundation

struct PostServices {
    private static var posts: [Post] = PostList.defaultPosts
    static func getHomeFeed() -> [Post] {
        return posts
    }
    static func makePost(post: Post) {
        posts.insert(post, at:0)
    }
}
