import Foundation
import Lottie
import SwiftUI
import UIKit
import WebKit

struct OnboardingView: View {
    
    @State var showSheet: Bool = true
    
    var body: some View {
        
        ZStack{
            CombineEssencesView()
        }
        .sheet(isPresented: $showSheet, content: {
            TabView {
                WelcomeView()
                DragAndDropView()
            }
            .edgesIgnoringSafeArea(.all)
            .tabViewStyle(.page)
        })
    }
}

struct WelcomeView: View {
    var body: some View{
        ZStack{
            Color.init(red: 1, green: 0.92, blue: 0.93 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("diff")
                    .resizable()
                    .frame(width: 129, height: 225, alignment: .center)
                
                Spacer().frame(height: 35)
                
                Text("Seja bem-vindo(a) ao Smelicious!")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                    .frame(width: 350,alignment: .center)
                
                Text("O aplicativo que te ajuda a combinar os melhores aromas e tornar o seu dia mais agradável.")
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .frame(width: 350,alignment: .center)
                
            }
        }
    }
}

struct DragAndDropView: View {
    var body: some View{
        ZStack{
            Color.init( red: 1, green: 0.92, blue: 0.93 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                GifImage("dragAndDrop")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                           RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 50/255, green: 73/255, blue: 60/255), lineWidth: 1).blur(radius: 0.3)
                            .shadow(color:Color(red: 50/255, green: 73/255, blue: 60/255), radius: 1)
                       )
                
                Spacer().frame(height: 20)
                
                Text("Vamos em busca do match perfeito?")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,20)
                    .frame(width: 350,alignment: .center)
                
                Text("Para encontrar seu aroma é necessário escolher duas essências diferentes que mais combinam com seu mood e arrastar até a área indicada.")
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .frame(width: 350,alignment: .center)
                
            }
        }
    }
}

struct PropertiesView: View {
    var body: some View{
        ZStack{
            Color.init( red: 1, green: 0.92, blue: 0.93 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("Dúvida em qual essência mais combina com você?")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                Text("Ao clicar na essência do seu interesse, as suas propriedades aromáticas serão exibidas. E aí, vamos encontrar sua combinação perfeita?")
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                NavigationLink(destination: CombineEssencesView(), label: {
                    Text("Começar")
                    .fontWeight(.medium)
                    .font(.system(.title3, design: .rounded))
                })
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
