//
//  ContentView.swift
//  EnrolledBatchesUI
//
//  Created by next on 11/02/26.
//

import SwiftUI

struct ContentView: View {
    
    let items = Array(repeating: 0, count: 10)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Enrolled Batches")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    ForEach(items.indices, id: \.self) { _ in
                        CardView()
                    }
                }
                .padding(.bottom, 80)
            }
            
            
            Button(action: {
                print("Question mark tapped")
            }) {
                ZStack {
                    Circle()
                        .fill(Color(hex: "#30558E"))
                        .frame(width: 48, height: 48)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.24), lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.24),
                                radius: 12,
                                x: 0,
                                y: 3)

                    Image("QuestionMark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.trailing, 20)
            .padding(.bottom, 30)
            .buttonStyle(.plain) 
        }
    }
}

struct CardView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#225384"),
                                Color(hex: "#499598"),
                                Color(hex: "#215384")
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .overlay(
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Diploma in")
                                .font(.system(size: 23, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Text("IFR")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 28)
                        .padding(.leading, 32),
                        alignment: .topLeading
                    )
                    .overlay(
                        Image("WorkingImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 212, height: 130)
                            .padding(.trailing, 1)
                            .padding(.bottom, -10),
                        alignment: .bottomTrailing
                    )
                    .frame(height: 185)
                    .padding(.horizontal, 16)
            }
            
            Text("Dip IFR-Feb26-Aug26-RC")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .padding(.leading, 32)
                .padding(.trailing, 16)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        self.init(
            red: Double((int >> 16) & 0xFF) / 255,
            green: Double((int >> 8) & 0xFF) / 255,
            blue: Double(int & 0xFF) / 255
        )
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
