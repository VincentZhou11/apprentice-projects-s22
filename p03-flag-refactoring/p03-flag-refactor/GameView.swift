//
//  GameView.swift
//  GuessTheFlag
//
//  Created by hawkeyeshi on 6/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct GameView: View {

    
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tap the flag of")
                    
                Text(gameViewModel.targetCountry.name)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                Text("Score: \(gameViewModel.score)")

                Spacer()
                    
                ForEach(gameViewModel.countries, id: \.id) { country in
                    Button(action: {
                        gameViewModel.buttonClick(country: country)
                    }) {
                        FlagImage(imageName: country.name)
                    }
                }
                    
                Spacer()
            }
            .alert(isPresented: $gameViewModel.showingAlert) {
                Alert(title: Text(gameViewModel.alertTitle),
                      message: Text("Your Score is \(gameViewModel.score)"),
                      dismissButton: .default(Text("Continue")) {
                    gameViewModel.countries = CountryList.countries.shuffled().prefix(3)
                    gameViewModel.correctAnswerIndex = Int.random(in: 0...2)
                })
            }
        }
        .preferredColorScheme(.dark)
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
