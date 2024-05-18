//
//  LaunchScreen.swift
//  CheffDelivery
//
//  Created by Rafael Seron on 17/05/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    //@State private var imageOffset: (Double, Double) = (0,0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundStyle(.colorRedDark)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? geometry.size.width-50 : geometry.size.width+50,
                              y: isAnimating ? geometry.size.height-50 : geometry.size.height+50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
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
                    
                    Image("launchScreenBurguer")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(32)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                            DragGesture()
                            .onChanged({ gestureChanged in
                                imageOffset = gestureChanged.translation
                            })
                            .onEnded({ gestureEnded in
                                imageOffset = .zero
                            })
                        
                        )
                    
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
