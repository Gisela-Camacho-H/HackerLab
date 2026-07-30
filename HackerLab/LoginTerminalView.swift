//
//  LoginTerminalView.swift
//  HackerLab
//
//  Created by Gis Cam on 27/07/26.
//

import SwiftUI

struct LoginTerminalView: View {
    @State private var inputUser: String = ""
    @State private var inputKey: String = ""
    @State private var isErrorShowing: Bool = false
    var onSuccess: () -> Void
    
    let imageNameInAssets: String = "escudo"
    
    private let validCredentials: [String: String] = [
        "10011": "pathway",
        "10012": "coding",
        "10013": "developer",
        "10014": "software",
        "10015": "mobile",
        "10016": "studying",
        "10017": "create",
        "10018": "logic",
        "10019": "ideas",
        "11010": "learning",
        "11011": "hacker",
        "11012": "cloud",
        "11013": "function",
        "11014": "pixel",
        "11015": "robot",
        "11016": "digital",
        "11017": "program",
        "11018": "security",
        "11019": "agente",
        "12010": "computer"
    ]
    
    var body: some View {
        ZStack {
            Color.darkGreenBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Spacer().frame(height: 10)
                    
                    // Ícono o Imagen del Escudo
                    Group {
                        if UIImage(named: imageNameInAssets) != nil {
                            Image(imageNameInAssets)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .shadow(color: .hackerGreen.opacity(0.8), radius: 20)
                        } else {
                            Image(systemName: "shield.checkered")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .foregroundColor(.hackerGreen)
                                .shadow(color: .hackerGreen.opacity(0.8), radius: 25)
                        }
                    }
                    
                    VStack(spacing: 6) {
                        Text("TERMINAL DE ACCESO")
                            .font(.system(size: 24, weight: .black, design: .monospaced))
                            .foregroundColor(.hackerGreen)
                            .multilineTextAlignment(.center)
                            .shadow(color: .hackerGreen.opacity(0.4), radius: 8)
                    }
                    .padding(.bottom, 10)
                    
                    // SECCIÓN CAMPO 1: USUARIO
                    VStack(alignment: .leading, spacing: 8) {
                        Text("User ID")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                            .foregroundColor(.hackerGreen)
                            .shadow(color: .hackerGreen.opacity(0.4), radius: 8)
                        
                        ZStack(alignment: .leading) {
                            if inputUser.isEmpty {
                                Text("ID DE AGENTE")
                                    .font(.system(.callout, design: .monospaced))
                                    .foregroundColor(.hackerGreen.opacity(0.5))
                                    .padding(.horizontal, 20)
                            }
                            
                            TextField("", text: $inputUser)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.white)
                                .keyboardType(.numberPad)
                                .padding(.horizontal, 20)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .onChange(of: inputUser) { _ in resetError() }
                        }
                        .frame(height: 50)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isErrorShowing ? Color.red : Color.hackerGreen, lineWidth: 2.0)
                        )
                    }
                    .padding(.horizontal, 30)
                    
                    // SECCIÓN CAMPO 2: CONTRASEÑA
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.system(size: 14, weight: .black, design: .monospaced))
                            .foregroundColor(.hackerGreen)
                            .shadow(color: .hackerGreen.opacity(0.4), radius: 8)
                        
                        ZStack(alignment: .leading) {
                            if inputKey.isEmpty {
                                Text("CONTRASEÑA SECRETA...")
                                    .font(.system(.callout, design: .monospaced))
                                    .foregroundColor(.hackerGreen.opacity(0.5))
                                    .padding(.horizontal, 20)
                            }
                            
                            SecureField("", text: $inputKey)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .onChange(of: inputKey) { _ in resetError() }
                        }
                        .frame(height: 50)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isErrorShowing ? Color.red : Color.hackerGreen, lineWidth: 2.0)
                        )
                    }
                    .padding(.horizontal, 30)
                    
                    // BOTÓN DE VALIDACIÓN
                    Button(action: validateCredentials) {
                        Text("INGRESAR AL SISTEMA")
                            .font(.system(.callout, design: .monospaced))
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.hackerGreen)
                            .cornerRadius(10)
                            .shadow(color: .hackerGreen.opacity(0.6), radius: 12)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    
                    // MENSAJE DE ERROR
                    if isErrorShowing {
                        VStack(spacing: 5) {
                            HStack(spacing: 8) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                Text("ACCESO DENEGADO")
                            }
                            .font(.system(.title3, design: .monospaced))
                            .bold()
                            .foregroundColor(.red)
                            .shadow(color: .red.opacity(0.8), radius: 10)
                            
                            Text("USUARIO O CLAVE INCORRECTA")
                                .font(.system(.subheadline, design: .monospaced))
                                .bold()
                                .foregroundColor(.red)
                                .shadow(color: .red.opacity(0.8), radius: 10)
                        }
                        .padding(.top, 10)
                        .transition(.move(edge: .top).combined(with: .opacity))
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 20)
            }
        }
    }
    
    // Función de validación de credenciales
    private func validateCredentials() {
        let cleanUser = inputUser.trimmingCharacters(in: .whitespaces)
        let cleanKey = inputKey.lowercased().trimmingCharacters(in: .whitespaces)
        
        if let expectedPassword = validCredentials[cleanUser], expectedPassword == cleanKey {
            isErrorShowing = false
            onSuccess()
        } else {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isErrorShowing = true
            }
        }
    }
    
    private func resetError() {
        if isErrorShowing {
            withAnimation {
                isErrorShowing = false
            }
        }
    }
}
