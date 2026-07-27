//
//  LoginTerminalView.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

struct LoginTerminalView: View {
    @State private var inputKey: String = ""
    @State private var isErrorShowing: Bool = false
    var onSuccess: () -> Void
    
    let imageNameInAssets: String = "escudo"
    
    var body: some View {
        
        ZStack {
            Color.darkGreenBackground
                .ignoresSafeArea()
            
            VStack(spacing: 35) {
                
                Spacer().frame(height: 10)
                
                Group {
                    if UIImage(named: imageNameInAssets) != nil {
                        Image(imageNameInAssets)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 170)
                            .shadow(color: .hackerGreen.opacity(0.8), radius: 20)
                    } else {
                        Image(systemName: "shield.checkered")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.hackerGreen)
                            .shadow(color: .hackerGreen.opacity(0.8), radius: 25)
                    }
                }
                
                VStack(spacing: 6) {
                    Text("TERMINAL DE ACCESO")
                        .font(.system(size: 26, weight: .black, design: .monospaced))
                        .foregroundColor(.hackerGreen)
                        .multilineTextAlignment(.center)
                        .shadow(color: .hackerGreen.opacity(0.4), radius: 8)
                }
                
                Spacer().frame(height: 10)
                
                ZStack(alignment: .leading) {
                    if inputKey.isEmpty {
                        Text("INGRESA LA CLAVE SECRETA...")
                            .font(.system(.callout, design: .monospaced))
                            .foregroundColor(.hackerGreen.opacity(0.5))
                            .padding(.horizontal, 20)
                    }
                    
                    SecureField("", text: $inputKey)
                            .font(.system(.body, design: .monospaced))
                            .tracking(8) // <-- Esto separa visualmente los puntos/asteriscos nativos sin alterar el texto
                            .foregroundColor(.white)
                            .padding()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .onChange(of: inputKey) { _ in
                                if isErrorShowing {
                                    withAnimation {
                                        isErrorShowing = false
                                    }
                                }
                            }
                    }
                .frame(height: 52)
                .background(Color.black.opacity(0.4))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isErrorShowing ? Color.red : Color.hackerGreen, lineWidth: 2.0)
                )
                .padding(.horizontal, 30)
                
                Button(action: {
                    if inputKey.lowercased().trimmingCharacters(in: .whitespaces) == "pathway" {
                        isErrorShowing = false
                        onSuccess()
                    } else {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            isErrorShowing = true
                        }
                    }
                }) {
                    Text("INGRESAR AL SISTEMA")
                        .font(.system(.callout, design: .monospaced))
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(Color.hackerGreen)
                        .cornerRadius(10)
                        .shadow(color: .hackerGreen.opacity(0.6), radius: 12)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 28)
                
                if isErrorShowing {
                    VStack(spacing: 5) {
                        HStack(spacing: 8) {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text("ACCESO DENEGADO:")
                        }
                        .font(.system(.title, design: .monospaced))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .red.opacity(0.8), radius: 10)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        
                        Text("CLAVE INCORRECTA")
                            .font(.system(.headline, design: .monospaced))
                            .bold()
                            .foregroundColor(.red)
                            .shadow(color: .red.opacity(0.8), radius: 10)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    .padding()
                }
                
                Spacer()
                
            }
            .padding()
            .padding(.top, 30)
        }
    }
}
