//
//  ContentView.swift
//  Counter
//
//  Created by Samuel Shi on 10/26/21.
//

import SwiftUI


struct Settings: View {
    
    @Binding var maxOccupancy: Int
    
    var body: some View {
        Form {
            Section() {
//                Text("Current Maximum: " + String(maxOccupancy))
//                HStack {
//                    Text("Set Maximum")
//                    Spacer()
//                    Button() {
//                        maxOccupancy += 1
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                    Button() {
//                        maxOccupancy -= maxOccupancy > 0 ? 1 : 0
//                    } label: {
//                        Image(systemName: "minus")
//                    }
//                }
                Stepper {
                    Text("Max Occupancy: \(maxOccupancy)")
                } onIncrement: {
                    maxOccupancy += 1
                } onDecrement: {
                    maxOccupancy -= maxOccupancy > 0 ? 1 : 0
                }
                
            }
        }.navigationTitle("Settings")
    }
}

struct ContentView: View {
    
    @State var counter: Int = 0
    @State var maxOccupancy: Int = 8
    
    var body: some View {
        NavigationView {
            ZStack {
//                LinearGradient(colors: [Color.green, Color.gray], startPoint: UnitPoint(x: 0.5,y: 0), endPoint: UnitPoint(x: 0.5,y: 1)).ignoresSafeArea()
                Color.blue.opacity(counter < maxOccupancy ? Double(maxOccupancy-counter)/Double(maxOccupancy) : 0.0).ignoresSafeArea()
                Color.red.opacity(counter < maxOccupancy ? Double(counter)/Double(maxOccupancy) : 1.0).ignoresSafeArea()
                VStack {
                    HStack {
                        Text(String(counter)+" People").foregroundColor(Color.white).font(Font.largeTitle)
                        
                        Spacer()
                        
                        NavigationLink(destination: Settings(maxOccupancy: $maxOccupancy)) {
                            Image(systemName: "gear").foregroundColor(Color.white).font(Font.largeTitle)
                        }
                    }.padding()
                    Spacer()
                    HStack {
                        Button {
                            withAnimation {
                                counter += 1
                            }
                            print("increase")
                        } label: {
                            Image(systemName: "plus").foregroundColor(Color.white).font(Font.largeTitle)
                        }
                        
                        Spacer()
                        
                        Button {
                            counter -= counter > 0 ? 1 : 0
                            print("decrease")
                        } label: {
                            Image(systemName: "minus").foregroundColor(Color.white).font(Font.largeTitle)
                        }
                        
                        
                    }.padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
