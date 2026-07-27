//
//  MisionSummaryView.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

struct MissionSummaryView: View {
    let alias: String
    let color: Color
    var onReset: () -> Void
    
    let badgeImageName: String = "mission_badge"
    
    var body: some View {
        ZStack {
            Color.darkGreenBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer().frame(height: 10)
                
                MissionBadgeView(imageName: badgeImageName, color: color)

                Text("¡MISIÓN ACTIVADA!")
                    .font(.system(size: 35, weight: .black, design: .monospaced))
                    .foregroundColor(color)
                    .multilineTextAlignment(.center)
                    .shadow(color: color.opacity(0.8), radius: 10)
                    .padding(.bottom, 20)
                
                MissionCardView(alias: alias, color: color)
                
                Spacer()
                
                Button(action: onReset) {
                    Text("REINICIAR PARA OTRO AGENTE")
                        .font(.system(.callout, design: .monospaced))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(color)
                        .cornerRadius(10)
                        .shadow(color: color.opacity(0.8), radius: 12)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct MissionBadgeView: View {
    let imageName: String
    let color: Color
    
    var body: some View {
        Group {
            if UIImage(named: imageName) != nil {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
            }
        }
        .frame(width: 200, height: 200)
        .shadow(color: color.opacity(0.9), radius: 15)
    }
}

struct MissionCardView: View {
    let alias: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Tu Gran Misión:")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                
                Text("Aprende código para crear herramientas que solucionen problemas reales y construyan tu futuro.")
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(4)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            
            Divider()
                .background(color.opacity(0.3))
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Opción para tu futuro:")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                
                Text("BYU-Pathway es una excelente opción de educación superior accesible para continuar tus estudios universitarios.")
                    .font(.system(size: 14, design: .monospaced))
                    .foregroundColor(.white.opacity(0.8))
                    .lineSpacing(4)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(40)
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.5))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(color, lineWidth: 2)
        )
        .shadow(color: color.opacity(0.4), radius: 10)
    }
}
