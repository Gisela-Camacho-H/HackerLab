//
//  HackerLabView.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

struct HackerLabView: View {
    
    let alias: String = "Agente_Cero"
    let imageName: String = "person.badge.shield.checkmark.fill"
    let color: Color = .hackerGreen
    let level: Double = 0.0
    
    var onComplete: () -> Void
    
    @State private var showError: Bool = false
    
    var datosCompletos: Bool {
        alias != "Agente_Cero" && imageName != "person.badge.shield.checkmark.fill" && level != 0.0
    }
    
    var body: some View {
        ZStack {
            Color.darkGreenBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                VStack(spacing: 10) {
                    Text("CREDENCIAL DE AGENTE")
                        .font(.system(size: 22, weight: .black, design: .monospaced))
                        .foregroundColor(color)
                        .multilineTextAlignment(.center)
                        .shadow(color: .hackerGreen.opacity(0.8), radius: 8)
                    
                    Text("ESTADO: REGISTRO ACTIVO")
                        .font(.system(.callout, design: .monospaced))
                        .foregroundColor(.hackerGreen.opacity(0.7))
                }
                .padding(.top, 20)
                
                CredentialBadgeView(
                    alias: alias,
                    imageName: imageName,
                    color: color,
                    level: level
                )
                
                Spacer()
                
                if showError {
                    VStack(spacing: 5) {
                        HStack(spacing: 8) {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text("ACCESO DENEGADO:")
                        }
                        .font(.system(.title2, design: .monospaced))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .red.opacity(0.8), radius: 10)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        
                        Text("FALTAN AJUSTAR DATOS")
                            .font(.system(.headline, design: .monospaced))
                            .bold()
                            .foregroundColor(.red)
                            .shadow(color: .red.opacity(0.8), radius: 10)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    .padding(.bottom, 25)
                }
                
                Button(action: {
                    if datosCompletos {
                        showError = false
                        onComplete()
                    } else {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showError = true
                        }
                    }
                }) {
                    Text("ACTIVAR MI CREDENCIAL")
                        .font(.system(.callout, design: .monospaced))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(color)
                        .cornerRadius(10)
                        .shadow(color: color.opacity(0.8), radius: 12)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
            }
            .padding()
        }
    }
}

struct CredentialBadgeView: View {
    let alias: String
    let imageName: String
    let color: Color
    let level: Double
    
    var body: some View {
        VStack(spacing: 0) {
            BadgeClipView(color: color)
            
            VStack(spacing: 24) {
                BadgeAvatarView(imageName: imageName, color: color)
                BadgeInfoView(alias: alias, level: level, color: color)
            }
            .frame(width: 300)
            .padding(.vertical, 35)
            .background(Color.black.opacity(0.8))
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(color, lineWidth: 2.5)
            )
            .shadow(color: color, radius: 10)
            .offset(y: -6)
        }
    }
}

struct BadgeClipView: View {
    let color: Color
    
    var body: some View {
        VStack(spacing: -2) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(color, lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color.black.opacity(0.6)))
                .frame(width: 32, height: 36)
                .overlay(
                    Circle()
                        .fill(color)
                        .frame(width: 8, height: 8)
                )
            
            Capsule()
                .stroke(color, lineWidth: 2)
                .background(Capsule().fill(Color.black))
                .frame(width: 54, height: 12)
        }
        .zIndex(1)
        .shadow(color: color.opacity(0.6), radius: 6)
    }
}

struct BadgeAvatarView: View {
    let imageName: String
    let color: Color
    
    var body: some View {
        Group {
            if UIImage(systemName: imageName) != nil {
                Image(systemName: imageName)
                    .resizable()
                    .symbolRenderingMode(.multicolor)
                    .scaledToFit()
                    .padding(25)
                    .foregroundColor(.white)
            
            } else if UIImage(named: imageName) != nil {
                Image(imageName)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
            
            } else {
                Image(systemName: "person.fill.badge.key")
                    .resizable()
                    .symbolRenderingMode(.multicolor)
                    .scaledToFit()
                    .padding(25)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 190, height: 190)
        .background(Color.black.opacity(0.4))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.8), lineWidth: 2)
        )
        .shadow(color: color.opacity(0.5), radius: 10)
        .padding(.top, 20)
    }
}

struct BadgeInfoView: View {
    let alias: String
    let level: Double
    let color: Color
    
    var body: some View {
        VStack(spacing: 30) {
            Text(alias.uppercased())
                .font(.system(size: 35, weight: .black, design: .monospaced))
                .foregroundColor(color)
                .shadow(color: color.opacity(0.9), radius: 10)
            
            HStack(spacing: 8) {
                Text("NIVEL:")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                
                Text("\(Int(level))")
                    .font(.system(size: 30, weight: .black, design: .monospaced))
                    .foregroundColor(color)
                    .shadow(color: color.opacity(0.8), radius: 6)
            }
        }
        .padding(.bottom, 20)
    }
}
