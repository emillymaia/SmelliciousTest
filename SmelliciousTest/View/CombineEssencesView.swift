//  CombineEssencesView.swift
//  SmelliciousTest
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms
import Lottie

struct CombineEssencesView: View {
    
    @State var essences: [EssenceModel] = essences_
    @State var essence1: EssenceModel? = nil
    @State var essence2: EssenceModel? = nil
    @State var popoverPositive = false
    @State var popoverNegative = false
    @State var smokeName = "defaultSmoke"
    @State var isPopover = false
    
    func ResetButton() -> some View {
        Button {
            smokeName = "defaultSmoke"
            essence1 = nil
            essence2 = nil
        }label: {
            Image(systemName: "arrow.clockwise")
                .resizable()
        }
        .foregroundColor(Color.init( red: 235/255, green: 252/255, blue: 225/255))
    }
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.init(red: 235/255, green: 252/255, blue: 225/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    ZStack{
                        Mancha()
                            .frame(width: 100, height: 180)
                            .offset(x: 0, y: -60)
                        VStack{
                            LottieView(name: smokeName, loopMode: .loop)
                                .frame(width: 250, height: 250)
                                .offset(x: 0, y: -200)
                        }
                        Difusor()
                            .frame(width: 100, height: 180)
                            .offset(x: 0, y: -20)
                    }
                    .offset(x: 0, y: 60)
                    VStack {
                        HStack(spacing: 31) {
                            
                            DropArea(essence: essence1){ id in
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                essence1 = droppedEssence
                                checkMisture()
                                smokeName = (essence1?.smokeColor)!
                            }
                            
                            DropArea2(essence: essence2) { id in
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                essence2 = droppedEssence
                                checkMisture()
                                smokeName = (essence2?.smokeColor)!
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
            SwiftUIView(popoverPositive: $popoverPositive, popoverNegative: $popoverNegative, smokeName: $smokeName, essence1: $essence1, essence2: $essence2)
            
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
                            let isSelected = row == essence1 || row == essence2
                            ImageElementComponent(essence: row)
                                .opacity(isSelected ? 0.5 : 1.0)
                            
                            
                            Text(row.value)
                        }
                        // MARK: - Adding Drag Operation
                        .onDrag {
                            //Returning ID to find wich Item is Moving
                            if row.id == essence1?.id || row.id == essence2?.id {
                                return NSItemProvider()
                            } else {
                                return .init(contentsOf: URL(string:row.id))!
                            }
                        } preview: {
                            Image(row.icon)
                                .resizable()
                                .cornerRadius(900)
                                .frame(width: SizesComponents.widthScreen*0.20,
                                       height: SizesComponents.widthScreen*0.20, alignment: .leading)
                                .contentShape(.dragPreview, Circle())
//                                .disabled(true)
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
            withAnimation {
                popoverPositive = true
            }
            
        } else {
            withAnimation {
                popoverNegative = true
            }
        }
        
        
        
        
        
    }
}

struct CombineEssencesView_Previews: PreviewProvider {
    static var previews: some View {
        CombineEssencesView()
    }
}
