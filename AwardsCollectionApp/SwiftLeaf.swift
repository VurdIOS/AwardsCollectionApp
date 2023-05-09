//
//  SwiftLeaf.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct SwiftLeaf: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            
            ForEach(0..<2) { iteration in
                Path { path in
                    path.move(to: CGPoint(x: nearLine, y: farLine))
                    path.addQuadCurve(
                        to: CGPoint(x: farLine, y: nearLine),
                        control: CGPoint(x: nearLine + nearLine, y: 0)
                    )
                    path.addQuadCurve(
                        to: CGPoint(x: nearLine, y: farLine),
                        control: CGPoint(x: farLine - nearLine, y: farLine)
                    )
                }
                .fill(
                    RadialGradient(
                        colors: [.cyan, .green],
                        center: .top,
                        startRadius: size * 0.05,
                        endRadius: size * 0.6
                    )
                )
                .rotationEffect(.degrees(Double(iteration) * 90))
                .shadow(radius: 10)
            }
            
            Image(systemName: "swift")
                .resizable()
                .foregroundColor(.white)
                .scaleEffect(nearLine / 50)
                .offset(y: -size / 30)

            
        }
    }
}

struct CurvesView_Previews2: PreviewProvider {
    static var previews: some View {
        SwiftLeaf()
            .frame(width: 200, height: 200)
    }
}
