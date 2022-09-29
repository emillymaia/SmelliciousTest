//  CombineEssencesView.swift
//  SmelliciousTest
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms
import Lottie
import AVFoundation

struct CombineEssencesView: View {
    
    @State var essences: [EssenceModel] = essences_
    @State var essence1: EssenceModel? = nil
    @State var essence2: EssenceModel? = nil
    @State var popupPositive = false
    @State var popupNegative = false
    @State var smokeName = "defaultSmoke"
    @State var isPopover = false
    @State var mutedAudio = false
    @State var audioPlayer: AVAudioPlayer!
    @State var humidify: AVAudioPlayer!
    @State var isPlaying = true
    @State var positiveFeedback = "Sparkless"
    @State var sparkles = false
    
    func drag(){
        let pathSounds = Bundle.main.path(forResource: "drag", ofType: "wav")!
        let url = URL(fileURLWithPath: pathSounds)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer.volume = 0.3
            
        }catch{
            print(error)
            
        }
        
    }
    
    func drop(){
        let pathSounds = Bundle.main.path(forResource: "drop", ofType: "wav")!
        let url = URL(fileURLWithPath: pathSounds)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            audioPlayer.volume = 0.3
            
        }catch{
            print(error)
            
        }
        
    }
    
    func playSounds(_ humidifySound : String) {
        guard let soundURL = Bundle.main.url(forResource: humidifySound, withExtension: nil) else {
            fatalError("Unable to find \(humidifySound) in bundle")
        }
        do {
            humidify = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        humidify.play()
        humidify.volume = 0.4
        humidify.numberOfLoops = 5
    }
    
    func ResetButton() -> some View {
        Button {
            smokeName = "defaultSmoke"
            essence1 = nil
            essence2 = nil
        }label: {
            Image(systemName: "arrow.clockwise")
                .resizable()
        }
        .foregroundColor(.black)
    }
    
    func mutedButton() -> some View {
        Button {
            if isPlaying {
                humidify.pause()
                isPlaying = false
            } else {
                humidify.play()
                isPlaying = true
            }
        }label: {
            Image(systemName: isPlaying ? "speaker.wave.2" :  "speaker.slash")
                .resizable()
        }
        .foregroundColor(.black)
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
                                let impact = UIImpactFeedbackGenerator(style: .heavy)
                                impact.impactOccurred()
                                hapticFeedback()
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                essence1 = droppedEssence
                                checkMisture()
                                if isPlaying == true{
                                    drop()
                                }
                                smokeName = (essence1?.smokeColor)!
                            }
                            
                            DropArea2(essence: essence2) { id in
                                let impact = UIImpactFeedbackGenerator(style: .heavy)
                                impact.impactOccurred()
                                hapticFeedback()
                                let droppedEssence = essences.first { essence in
                                    return essence.id == id
                                }
                                essence2 = droppedEssence
                                checkMisture()
                                if isPlaying == true{
                                    drop()
                                }
                                smokeName = (essence2?.smokeColor)!
                            }
                        }
                        
                        Divider()
                            .frame(width:330)
                            .padding(.top)
                        Text("Essences")
                            .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                            .font(.system(.title, design: .rounded))
                            .frame(width: 132, height: 34, alignment: .bottom)
                        
                        DragArea()
                        Divider()
                            .frame(width:330)
                    }
                    
                }.ignoresSafeArea()
                    .toolbar {
                        ResetButton()
                        mutedButton()
                    }
            }
        }
        .onAppear(perform: {
            playSounds("humidifySound.mp3")
        })
        .overlay {
            if sparkles {
                LottieView(name: "confete")
                    .offset(x: 0, y: -200)
            }
        
            popupView(popupPositive: $popupPositive, popupNegative: $popupNegative, smokeName: $smokeName, essence1: $essence1, essence2: $essence2, sparkles: $sparkles)
                
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
                                .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                        }
                        // MARK: - Adding Drag Operation
                        .onDrag {
                            if isPlaying == true{
                                drag()
                            }
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
            
            DispatchQueue.main.async {
                withAnimation {
                    sparkles = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    popupPositive = true
                }
            }
            
            
        } else {
            withAnimation {
                popupNegative = true
            }
        }
        
    }
}

extension View {
    func hapticFeedback (style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: .heavy)
            impact.impactOccurred()
        }
    }
}
