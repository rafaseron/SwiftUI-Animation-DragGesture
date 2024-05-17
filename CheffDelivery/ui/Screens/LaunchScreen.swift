//
//  LaunchScreen.swift
//  CheffDelivery
//
//  Created by Rafael Seron on 17/05/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(.colorRed)
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                Circle()
                    .foregroundStyle(.colorRedDark)
                    .frame(width: 200)
                    .position(x: geometry.size.width-50, y: geometry.size.height-50)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                VStack{
                    Text("Cheff Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorRed)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black .opacity(0.7))
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Spacer()
                }.onAppear{
                    withAnimation(.easeInOut(duration: 1.5)){
                        isAnimating = true
                    }
            }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
