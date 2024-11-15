//
//  ChartView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 12.11.2024.
//

import SwiftUI

struct ChartView: View {
    
    private let data: [Double]
    private let maxY, minY: Double
    private let lineColor: Color
    private let startingDate, endingDate: Date
    
    @State private var progress: CGFloat = 0
    
    init(coin: CoinModel) {
        self.data = coin.sparklineIn7D?.price ?? []
        self.maxY = data.max() ?? 0
        self.minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange >= 0 ? .greenApp : .redApp
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartYAxis.padding(.horizontal, 4) ,alignment: .leading)
            
            chardDateLabel
                .padding(.horizontal, 4)
            
        }
        .font(.caption)
        .foregroundStyle(.secondaryApp)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 2.0)) {
                    progress = 1.0
                }
            }
        }
    }
}

#Preview {
    ChartView(coin: DeveloperPreview.dev.coin)
}


extension ChartView {
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    let yPosition: CGFloat = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height

                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: progress)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor, radius: 10, x: 0, y: 10)
            .shadow(color: lineColor.opacity(0.5), radius: 10, y: 20)
            .shadow(color: lineColor.opacity(0.2), radius: 10, y: 30)
            .shadow(color: lineColor.opacity(0.1), radius: 10, y: 40)
            .overlay(
                shadowAnimator
            )
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            Text(((maxY + minY) / 2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
    }
    
    private var chardDateLabel: some View {
        HStack {
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
    
    //helps to render couple shadow.
    private var shadowAnimator: some View {
        GeometryReader { geometry in
            Color.clear
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
