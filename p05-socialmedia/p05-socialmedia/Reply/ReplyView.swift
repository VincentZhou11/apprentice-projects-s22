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
        VStack(alignment:.leading, spacing:0) {
            (Text("Replying to ") + Text("@\(replyUsername)").foregroundColor(.blue)).padding(.leading, 20)
            Form {
                TextEditor(text: $reply)
                Button {
                    
                } label: {
                    Text("Post")
                }
            }
            
        }.padding([.leading, .trailing]).navigationTitle("Reply").navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
    }
}

struct ReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ReplyView(replyUsername: "exampleuser").bothColorSchemes()
    }
}
