//
//  MatrixRainView.swift
//  MatrixRainEffect
//
//  Created by 蘇健豪 on 2022/2/15.
//

import SwiftUI

struct MatrixRainView: View {
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
                ForEach(1...Int(size.width / 25), id: \.self) { _ in
                    MatrixRainCharactersView(size: size)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixRainView()
    }
}

