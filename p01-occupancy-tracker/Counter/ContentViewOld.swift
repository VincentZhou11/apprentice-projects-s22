//
//  ContentView.swift
//  Counter
//
//  Created by Samuel Shi on 10/25/21.
//

import SwiftUI

struct ContentViewOld: View {
    @State private var count = 0
    @State private var max = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()

                Color.red
                    .ignoresSafeArea()
                    .opacity(Double(count) / Double(max))
                                
                VStack {
                    HStack {
                        Text("\(count) people")
                            .font(.system(size: 50))
                            
                        Spacer()
                            
                        NavigationLink(destination: SettingsView(max: $max)) {
                            Image(systemName: "gear")
                                .font(.largeTitle)
                        }
                    }
                        
                    Spacer()
                        
                    HStack {
                        Button {
                            if count > 0 {
                                count -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 75))
                                .padding()
                        }
                            
                        Spacer()
                            
                        Button {
                            count += 1
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 75))
                                .padding()
                        }
                    }
                }
                .padding()
                .buttonStyle(.plain)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SettingsView: View {
    @Binding var max: Int
    
    var body: some View {
        Form {
            Stepper("Maximum Occupancy: \(max)", value: $max, in: 0 ... Int.max)
        }
        .navigationTitle("Settings")
    }
}

struct ContentViewOld_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOld()
    }
}
