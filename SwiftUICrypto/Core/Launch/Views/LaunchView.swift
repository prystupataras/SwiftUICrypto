//
//  LaunchView.swift
//  SwiftUICrypto
//
//  Created by Taras Prystupa on 15.11.2024.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var showLoadingText: Bool = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var timerCounter: Int = 0
    @State private var loops: Int = 0
    
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launchBackground
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: timerCounter == loadingText.count / 2 ? 180 : 0))
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(.launchAccent)
                                .offset(y: timerCounter == index ? -5 : 0)
                                
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
                
            }
            .offset(y: 70)
            .onAppear {
                showLoadingText.toggle()
            }
            .onReceive(timer) { _ in
                withAnimation(.spring()) {
                    let lastIndex = loadingText.count - 1
                    
                    if timerCounter == lastIndex {
                        timerCounter = 0
                        loops += 1
                        if loops == 3 {
                            showLaunchView = false
                        }
                    } else {
                        timerCounter += 1
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
