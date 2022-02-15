//
//  ContentView.swift
//  MatrixRainEffect
//
//  Created by 蘇健豪 on 2022/2/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            MatrixRainView()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
