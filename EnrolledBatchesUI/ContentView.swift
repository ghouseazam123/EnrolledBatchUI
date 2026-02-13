//
//  ContentView.swift
//  EnrolledBatchesUI
//
//  Created by next on 11/02/26.
//

import SwiftUI

struct ContentView: View {
    
    let items = Array(repeating: 0, count: 10)
    let hasLiveClass:Bool = true
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Enrolled Batches")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                    ForEach(items.indices, id: \.self) { _ in
                        CardView()
                    }
                }
            }
            VStack(alignment: .trailing){
                Spacer()
                supportButton
                if hasLiveClass {
                    LiveSessionCardView()
                }
            }
            
        }
    }
}
            
extension ContentView {
    
    private var supportButton: some View {
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
            .padding(.trailing, 16)
            .buttonStyle(.plain)
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
                .padding(.leading, 24)
               
            Text("DIP IFR-Hybrid")
                .font(.system(size:12,weight:.semibold))
                .foregroundColor(Color(hex:"#3C5777"))
                .padding(.leading,24)
        }
    }
}
struct LiveSessionCardView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack(spacing: 6) {
                        Text("Live Now")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                        Image("dot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color(hex: "#EF4949"))
                    .cornerRadius(18)
                    
                    
                    HStack(spacing: 8) {
                        
                        Image("clock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        
                        Text("9:00 AM - 10:30 AM")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(Color(hex: "#55667E"))
                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color(hex: "#55667E"))
                        
                        Text("Naveen Kumar Poolambeti")
                            .font(.system(size: 10, weight: .regular)).lineLimit(1)
                            .foregroundColor(Color(hex: "#55667E"))
                    }
                }
                Spacer()
                
                Button(action: {}) {
                    Text("Join Now")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(hex: "#FFFFFF"))
                        .frame(width: 90, height: 36)
                        .background(Color(hex: "#30558E"))
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color(hex: "#1C456752").opacity(0.5), lineWidth: 0.5)
                        )
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
                }
                .padding(.top, 23)
            }
            Text("International Source of authority")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(hex: "#000000"))
                .padding(.top, 8)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "#FFD192"),
                        Color(hex: "#FFF9F0"),
                        Color(hex: "#FFFFFF")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                )
        .overlay(
                RoundedCorner(radius: 16, corners: [.topLeft, .topRight])
                    .stroke(Color(hex: "E2A654"), lineWidth: 1)

        )
        .cornerRadius(16, corners: [.topLeft, .topRight])
    }
}
extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        self.init(
            red: Double((int >> 16) & 0xFF) / 255,
            green: Double((int >> 8) & 0xFF) / 255,
            blue: Double(int & 0xFF) / 255,
            opacity: opacity
        )
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
