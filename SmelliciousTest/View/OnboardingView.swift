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
            Color.init(red: 0.89, green: 0.88, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("diff")
                    .resizable()
                    .frame(width: 129, height: 225, alignment: .center)
                
                Spacer().frame(height: 35)
                
                Text("Hey you! Welcome to Smellicious!")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                    .frame(width: 350,alignment: .center)
                
                Text("The app that helps you combine the best scents and make your day more pleasant")
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
            Color.init( red: 0.89, green: 0.88, blue: 0.99 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                GifImage("dragAndDrop")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 50/255, green: 73/255, blue: 60/255), lineWidth: 1).blur(radius: 0.3)
                            .shadow(color:Color(red: 50/255, green: 73/255, blue: 60/255), radius: 1)
                    )
                
                Spacer().frame(height: 20)
                
                Text("Are you looking for the perfect match?")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,20)
                    .frame(width: 350,alignment: .center)
                
                Text("To discover new aromas, choose two different essences that best match your mood and drag them to the indicated area")
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
                
                Text("Are you in doubt which essence best matches you?")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                Text("Click on the essence of your interest and discover all the benefits it can bring")
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                Text("So, let's find your perfect match?")
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                NavigationLink(destination: CombineEssencesView(), label: {
                    Text("Start")
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
