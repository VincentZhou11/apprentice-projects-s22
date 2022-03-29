//
//  MilesRanView.swift
//  p07-runny
//
//  Created by Vincent Zhou on 3/8/22.
//

import SwiftUI

struct MilesRanView: View {
    
    @StateObject var vm =  MilesRanViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.milesRan, specifier: "%.2f")").font(.largeTitle)
            HStack {
                Button {
                    vm.increment(amount: 0.50)
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                Button {
                    vm.decrement(amount: 0.50)
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
        }
        
    }
}

struct MilesRanView_Previews: PreviewProvider {
    static var previews: some View {
        MilesRanView()
    }
}
