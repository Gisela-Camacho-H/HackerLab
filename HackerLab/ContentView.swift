//
//  ContentView.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

struct AgentContentView: View {
    @State private var currentStep: Int = 1
    
    var body: some View {
        ZStack {
            Color.darkGreenBackground
                .ignoresSafeArea(.all)

            VStack {
                ForEach(0..<10) { _ in
                    Divider().background(Color.hackerBlue.opacity(0.1))
                    Spacer()
                }
            }
            .allowsHitTesting(false)
            .ignoresSafeArea(.all)
            
            VStack {
                if currentStep == 1 {
                    LoginTerminalView(onSuccess: {
                        withAnimation { currentStep = 2 }
                    })
                } else if currentStep == 2 {
                    HackerLabView(onComplete: {
                        withAnimation { currentStep = 3 }
                    })
                } else {
                    MissionSummaryView(
                        alias: "AGENTE_CERO",
                        color: .hackerGreen,
                        onReset: { withAnimation { currentStep = 1 } }
                    )
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
