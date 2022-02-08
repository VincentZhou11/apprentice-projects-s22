//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by Vincent Zhou on 2/8/22.
//

import SwiftUI

struct NewPostView: View {
    @State var text = ""
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("New Post")
            TextField("Reply", text: $text)
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView().bothColorSchemes()
    }
}
