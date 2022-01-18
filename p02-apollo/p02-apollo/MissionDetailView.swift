//
//  MissionDetailView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/12/22.
//

import SwiftUI

struct MissionDetailView: View {
    // use this mission to display the content on the detail view
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack{
                Image(mission.imageName).resizable()
                    .scaledToFit().frame(width:200, height:200)
                Text(mission.launchDate?.formatted(Date.FormatStyle().month().day().year()) ?? "N/A").bold().padding(.bottom).foregroundColor(.secondary)
                Text(mission.description)
                VStack(alignment:.leading) {
                    ForEach(mission.crew, id: \.id) { crew in
                        HStack{
                            Image(crew.imageName).resizable().scaledToFit().frame(width: 100)
                            Text(crew.name)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment:.topLeading)
        
            }.padding().navigationTitle(Text(mission.displayName))
        }
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailView(mission: .example).preferredColorScheme(.dark)
    }
}
