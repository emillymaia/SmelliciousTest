//
//  SwiftUIView.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 16/09/22.
//

import SwiftUI

struct popupView: View {
    @Binding var popupPositive: Bool
    @Binding var popupNegative: Bool
    @Binding var smokeName: String
    @Binding var essence1: EssenceModel?
    @Binding var essence2: EssenceModel?
    
    var body: some View {
        
        if popupNegative {
            VisualEffectView(effect: UIBlurEffect(style: .extraLight))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay { popNegative }
                .transition(.scale)
        }

        if popupPositive {
            VisualEffectView(effect: UIBlurEffect(style: .extraLight))
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
                .overlay { popPositive }
                .transition(.scale)
        }
    }
        var popNegative: some View {
            VStack{
                HStack{
                    Image("sad")
                        .frame(width: 75 , height: 75, alignment: .bottom)
                        .clipShape(Circle())
                        .padding([.top, .leading, .bottom], 20)
                        .padding(.trailing, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Ooops!")
                            .foregroundColor(.white)
                            .font(Font.title.weight(.semibold))
                            .font(.system(size: 10))
                        
                        Text("A combinação escolhida não parece combinar. Que tal tentar uma nova combinacão de fragrância para melhorar seu dia?")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .padding(.trailing, 10)
                    }
                    
                }
                Button(action: {
                    resetEssence()
                    withAnimation {
                        popupNegative = false
                    }
                }) {
                    Text("Dimiss")
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color(.white))
                        .foregroundColor(.black)
                        .clipShape(Rectangle())
                }
                
            }
            .background {
                Rectangle()
                    .fill(Color(red: 0.68, green: 0.55, blue: 0.53))
                    .foregroundColor(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 30)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
        var popPositive: some View {
            VStack{
                HStack{
                    Image("happy")
                        .frame(width: 75 , height: 75, alignment: .bottom)
                        .clipShape(Circle())
                        .padding([.top, .leading, .bottom], 20)
                        .padding(.trailing, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Yaaaay!")
                            .foregroundColor(.white)
                            .font(Font.title.weight(.semibold))
                            .font(.system(size: 10))
                        
                        Text("Sua combinação é um sucesso. Relaxe e aproveite seu novo aroma! Que tal ler um livro para deixar esse momento perfeito?")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                            .padding(.trailing, 10)
                    }
                    
                }
                
                Button(action: {
                    resetEssence()
                    withAnimation {
                        popupPositive = false
                    }
                }) {
                    Text("Dimiss")
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color(.white))
                        .foregroundColor(.black)
                        .clipShape(Rectangle())
                }
                
            }
            .background {
                Rectangle()
                    .fill(Color(red: 0.40, green: 0.55, blue: 0.46))
                    .foregroundColor(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 30)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
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
    

