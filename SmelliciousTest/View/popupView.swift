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
    @Binding var sparkles: Bool

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
                    .frame(width: 80 , height: 80, alignment: .bottom)
                    .clipShape(Circle())
                    .padding([.top, .leading], 20)
                    .padding(.bottom,15)
                    .padding(.trailing, 15)
                
                VStack(alignment: .leading) {
                    Text("Oh no!")
                        .padding(.top,3)
                        .foregroundColor(.white)
                        .font(.system(.title, design: .rounded))

                    Text(essence1?.badMisture ?? " ")
                        .foregroundColor(.white)
                        .font(.system(size: 14, design: .rounded))
                        .padding(.trailing, 10)
                }
                
            }
            Button(action: {
                resetEssence()
                withAnimation {
                    popupNegative = false
                }
            }) {
                Text("Dismiss")
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color(.white))
                    .foregroundColor(.black)
                    .clipShape(Rectangle())
            }
            
        }
        .background {
            Rectangle()
                .fill(Color(red: 208/255, green: 196/255, blue: 223/255))
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
                    .frame(width: 80 , height: 80, alignment: .bottom)
                    .clipShape(Circle())
                    .padding([.top, .leading], 20)
                    .padding(.bottom,15)
                    .padding(.trailing, 15)
                
                VStack(alignment: .leading) {
                    Text("Yaaaay!")
                        .padding(.top,3)
                        .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                        .font(.system(.title, design: .rounded))
                    
                    Text("Your combination is a success! Enjoy your new scent. How about reading a book to make this moment even more perfect?")
                        .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                        .font(.system(size: 14, design: .rounded))
                        .padding(.trailing, 10)
                }
                
            }
            
            Button(action: {
                resetEssence()
                sparkles = false
                withAnimation {
                    popupPositive = false
                }
            }) {
                Text("Dismiss")
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color(.white))
                    .foregroundColor(.black)
                    .clipShape(Rectangle())
            }
            
        }
        .background {
            Rectangle()
                .fill(Color(red: 250/255, green: 197/255, blue: 227/255))
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


