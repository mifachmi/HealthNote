//
//  WaveformView.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 01/06/24.
//

import SwiftUI

struct WaveformView: View {
    var audioLevels: [Float]
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let barWidth = width / CGFloat(audioLevels.count)
            
            HStack(alignment: .center, spacing: 2) {
                ForEach(audioLevels, id: \.self) { level in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: barWidth, height: max(1, height * CGFloat((level + 50) / 50)))
                }
            }
        }
    }
}

#Preview {
    WaveformView(audioLevels: [])
}
