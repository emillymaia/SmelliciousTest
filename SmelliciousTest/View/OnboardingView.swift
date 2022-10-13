import Foundation
import Lottie
import SwiftUI
import UIKit
import WebKit

public struct OnboardingView: View {
    @AppStorage("showsOnboard") var showsOnboard: Bool = true
    @State var showSheet: Bool = true
    
    
    var body: some View {
        
        ZStack{
            CombineEssencesView()
        }
        .sheet(isPresented: $showsOnboard, onDismiss: onDismiss, content: {
            TabView {
                WelcomeView()
                DragAndDropView()
                PropertiesView(showsOnboard: $showsOnboard)
            }
            .edgesIgnoringSafeArea(.all)
            .tabViewStyle(.page)
        })
    }
    func onDismiss() {
        showsOnboard = false
    }
}


public struct WelcomeView: View {
    var body: some View{
        ZStack{
            Color.init(red: 0.89, green: 0.88, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("diff")
                    .resizable()
                    .frame(width: 225, height: 239, alignment: .center)
                
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

public struct DragAndDropView: View {
    var body: some View{
        ZStack{
            Color.init( red: 0.89, green: 0.88, blue: 0.99 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                GifImage("dragAndDrop")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
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

public struct PropertiesView: View {
    
    @Binding var showsOnboard: Bool
    
    var body: some View{
        ZStack{
            Color.init( red: 0.89, green: 0.88, blue: 0.99 )
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                GifImage("properties")
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(red: 50/255, green: 73/255, blue: 60/255), lineWidth: 1).blur(radius: 0.3)
                            .shadow(color:Color(red: 50/255, green: 73/255, blue: 60/255), radius: 1)
                    )
                
                Spacer().frame(height: 20)
                
                Text("Are you in doubt which essence best matches you?")
                    .fontWeight(.medium)
                    .font(.system(.title, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                Text("""
                    Click on the essence of your interest and discover all the benefits it can bring
                    So, let's find your perfect match?
                    """)
                    .fontWeight(.regular)
                    .font(.system(.title3, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .padding(.bottom,30)
                
                Button(action: {
                    showsOnboard.toggle()
                }, label: {
                    Text("Let's go!")
                    .foregroundColor(Color(red: 50/255, green: 73/255, blue: 60/255))
                    .fontWeight(.medium)
                    .font(.system(.title2, design: .rounded))
                    .frame(width: 120,height: 50)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.init(red: 235/255, green: 252/255, blue: 225/255)))
                })
                
            }
        }
    }
}



public struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
