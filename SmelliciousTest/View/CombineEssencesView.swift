//  CombineEssencesView.swift
//  SmelliciousTest
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms

struct CombineEssencesView: View {
    
    @State var essences: [EssenceModel] = essences_
    
    @State var essence1: EssenceModel? = nil
    @State var essence2: EssenceModel? = nil
    @State var isShowingPopover = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.init( red: 1, green: 0.92, blue: 0.93 )
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    LottieView(name: "defaultSmoke", loopMode: .loop)
                        .frame(width: 250, height: 250)
                    Difusor()
                        .frame(width: 100, height: 180)
                        .offset(x: 0, y: -20)
                    VStack {
                        HStack(spacing: 31) {
                            
                            DropArea(essence: essence1){ id in
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                
                                essence1 = droppedEssence
                                
                                checkMisture()
    }
                            
                            DropArea2(essence: essence2) { id in
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                
                                essence2 = droppedEssence
                                checkMisture()
                            }
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
        .overlay {
            if isShowingPopover {
                VisualEffectView(effect: UIBlurEffect(style: .light))
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 0.89, green: 0.95, blue: 0.91))
                    .frame(width: 400, height: 200)
                    .overlay {
                        Text("YAAAAY!")
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
                            withAnimation {
                                isShowingPopover = false
                            }
                        }) {
                            Text("Dimiss")
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
                            ImageElementComponent(image: row.icon)
                            
                            
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
    
    func checkMisture() {
        guard let essence1 = essence1 else {
            return
        }
        guard let essence2 = essence2 else {
            return
        }
        
        if essence2.niceMistures.contains(essence1.value) {
            isShowingPopover = true
        } else {
            print("deu errado")
        }
    }
}



struct CombineEssencesView_Previews: PreviewProvider {
    static var previews: some View {
        CombineEssencesView()
    }
}
