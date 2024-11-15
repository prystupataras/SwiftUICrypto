//
//  StatisticView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 11.11.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(.secondaryApp)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? .greenApp : .redApp)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        StatisticView(stat: DeveloperPreview.dev.stat1)
            .preferredColorScheme(.dark)
        StatisticView(stat: DeveloperPreview.dev.stat2)
        
        StatisticView(stat: DeveloperPreview.dev.stat3)
    }
    
}
