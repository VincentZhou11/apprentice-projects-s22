//
//  NewPostViewModel.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/22/22.
//

import Foundation

class NewPostViewModel: ObservableObject {
    @Published var currentPostText = ""
    func makePost() {
        let newPost = Post(id: UUID(),
                           authorName: "Blue Bird",
                           authorUsername: "bluebird",
                           authorImageAddress: "bluebird",
                           datePosted: Date(),
                           postContent: currentPostText,
                           likeCount: 0,
                           commentCount: 0)
        PostServices.makePost(post: newPost)
        currentPostText = ""
    }
}
