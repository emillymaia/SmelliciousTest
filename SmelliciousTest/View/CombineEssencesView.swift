//
//  CombineEssencesView.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms

struct CombineEssencesView: View {
    
    @State var essences: [EssenceModel] = essences_
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                VStack(spacing: 0) {
                    LottieView(name: "pink-smoke", loopMode: .loop)
                        .frame(width: 250, height: 250)
                        //.opacity(0.50)
                    Difusor()
                        .frame(width: 100, height: 180)
                        .offset(x: 0, y: -20)
                    VStack {
                        HStack(spacing: 31) {
                            DropArea()
                            DropArea()
                        }
                        Divider()
                            .frame(width:330)
                            .padding(.top)
                        Text("Elementos")
                            .font(.system(.title))
                            .frame(width: 132, height: 34, alignment: .bottom)
                        DragArea()
                    }

                }.ignoresSafeArea()
                .toolbar {
                    ResetButton()
                }
                
            }
        }
    }
    
    @ViewBuilder
    func DragArea() -> some View {
        TabView {
            let chunks = Array(essences.chunks(ofCount: 3))
            ForEach(0..<4) { page in
                let essences = chunks[page]
                HStack(spacing: 30) {
                    ForEach(essences, id: \.self) { row in
                        VStack{
                            Image(row.icon)
                                .resizable()
                                .cornerRadius(900)
                                .frame(width: 90,
                                       height: 90, alignment: .leading)
                                .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23), lineWidth: 2))

                            
                            Text(row.value)
                        }
                        // MARK: - Adding Drag Operation
                        .onDrag {
                            //Returning ID to find wich Item is Moving
                            return .init(contentsOf: URL(string:row.id))!
                        } preview: {
                            Image(row.icon)
                                .resizable()
                                .cornerRadius(900)
                                .frame(width: SizesComponents.widthScreen*0.20,
                                       height: SizesComponents.widthScreen*0.20, alignment: .leading)
                                .contentShape(.dragPreview, Circle())
                        }
                    }
                }
            }
        }
        
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame( height: 200)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    }
}

struct CombineEssencesView_Previews: PreviewProvider {
    static var previews: some View {
        CombineEssencesView()
    }
}
