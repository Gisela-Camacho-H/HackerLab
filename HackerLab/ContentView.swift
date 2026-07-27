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
            
        }
        .preferredColorScheme(.dark)
    }
}
