//
//  MatrixRainCharactersView.swift
//  MatrixRainEffect
//
//  Created by 蘇健豪 on 2022/2/15.
//

import SwiftUI

struct MatrixRainCharactersView: View {
    
    let size: CGSize
    @State var startAnimation: Bool = false
    @State var randomIndex: Int = 0
    
    let constant = "abcdefghijklmnopqrstuvwxyz1234567890"
    
    var body: some View {
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
            ForEach(0..<constant.count, id: \.self) { index in
                let character = Array(constant)[getRandomIndex(index)]
                Text(String(character))
                    .font(.custom("Matrix Code NFI", size: 25))
                    .foregroundColor(Color(hex: "00FF41"))
            }
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7)
                    ],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .frame(height: size.height / 2)
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear {
            withAnimation(.linear(duration: 12)
                            .delay(.random(in: 0...2))
                            .repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            randomIndex = Int.random(in: 0..<constant.count)
        }
    }
    
    func getRandomIndex(_ index: Int) -> Int {
        let max = constant.count - 1
        
        if (index + randomIndex) > max {
            if (index - randomIndex) < 0 {
                return index
            } else {
                return index - randomIndex
            }
        } else {
            return index + randomIndex
        }
    }
    
}

struct MatrixRainCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixRainCharactersView(size: CGSize(width: 50, height: 50))
    }
}
