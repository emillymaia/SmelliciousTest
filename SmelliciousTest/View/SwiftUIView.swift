//
//  SwiftUIView.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 16/09/22.
//

import SwiftUI

struct SwiftUIView: View {
    @Binding var popoverPositive: Bool
    @Binding var popoverNegative: Bool
    @Binding var smokeName: String
    @Binding var essence1: EssenceModel?
    @Binding var essence2: EssenceModel?
    
    var body: some View {
        if popoverNegative {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.89, green: 0.95, blue: 0.91))
                .frame(width: 400, height: 200)
                .overlay {
                    Text("AFFFFF :( !")
                        .foregroundColor(Color(red: 0.20, green: 0.29, blue: 0.24))
                        .font(Font.title.weight(.bold))
                        .font(.system(size: 25))
                        .offset(x: 5, y: -65)
                    Text("Sua combinação é um sucesso! Relaxe e aproveite seu novo aroma! Que tal ler um livro para deixar esse momento perfeito?")
                        .foregroundColor(Color(red: 0.20, green: 0.29, blue: 0.24))
                        .font(.system(size: 16))
                        .frame(width: 250, height: 100)
                        .offset(x: 65, y: -10)
                    Image("Baunilha")
                        .frame(width: 100 , height: 100, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .offset(x: -120.0, y: -25)
                    Button(action: {
                        resetEssence()
                        withAnimation {
                            popoverNegative = false
                        }
                        
                    }) {
                        Text("Dismiss")
                            .frame(width: 400 , height: 50, alignment: .center)
                            .background(Color(.white))
                            .foregroundColor(.black)
                            .clipShape(Rectangle())
                    }
                    .offset(x: 0.0, y: 75.0)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .transition(.scale)
        }
        if popoverPositive {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.89, green: 0.95, blue: 0.91))
                .frame(width: 400, height: 200)
                .overlay {
                    Text("YAAAAY :3 !")
                        .foregroundColor(Color(red: 0.20, green: 0.29, blue: 0.24))
                        .font(Font.title.weight(.bold))
                        .font(.system(size: 25))
                        .offset(x: 5, y: -65)
                    Text("Sua combinação é um sucesso! Relaxe e aproveite seu novo aroma! Que tal ler um livro para deixar esse momento perfeito?")
                        .foregroundColor(Color(red: 0.20, green: 0.29, blue: 0.24))
                        .font(.system(size: 16))
                        .frame(width: 250, height: 100)
                        .offset(x: 65, y: -10)
                    Image("Baunilha")
                        .frame(width: 100 , height: 100, alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .offset(x: -120.0, y: -25)
                    Button(action: {
                        resetEssence()
                        withAnimation {
                            popoverPositive = false
                        }
                    }) {
                        Text("Dismiss")
                            .frame(width: 400 , height: 50, alignment: .center)
                            .background(Color(.white))
                            .foregroundColor(.black)
                            .clipShape(Rectangle())
                    }
                    .offset(x: 0.0, y: 75.0)
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .transition(.scale)
        } 
    }
    func resetEssence() {
        smokeName = "defaultSmoke"
        essence1 = nil
        essence2 = nil
    }
}
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView(popoverPositive: .constant(true), popoverNegative: .constant(true))
//    }
//}

