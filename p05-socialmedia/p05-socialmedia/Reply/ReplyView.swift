//
//  ReplyView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct ReplyView: View {
    let replyUsername: String
    @State var reply = ""
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("replying to ") + Text("@\(replyUsername)").foregroundColor(.blue)
            TextField("Reply", text: $reply)
        }
    }
}

struct ReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyView(replyUsername: "exampleuser").bothColorSchemes()
    }
}
