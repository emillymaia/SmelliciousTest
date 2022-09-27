//
//  EssenceModel.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import BottomSheet

// MARK: - CHaracter Model and Sample Data


struct EssenceModel: Identifiable, Hashable, Equatable {
    var id = UUID().uuidString
    var value: String
    var icon: String
    var smokeColor: String
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 19
    var isShowing: Bool = false
    var textDescription: String
    var image: Image {
        Image(icon)
    }
    var niceMistures: [String] = []
}


var essences_: [EssenceModel] = [
    EssenceModel(value: "Mint", icon: "Hortela",
                 smokeColor: "greenSmoke", textDescription: "It helps with concentration and motivates high performance in activities, as well as making breathing more pleasant due to the menthol aroma.",
                 niceMistures: ["Lemon", "Lavender", "Vanilla", "Ylang Ylang"]
                ),
    EssenceModel(value: "Passion Fruit", icon: "Maracuja",
                 smokeColor: "yellowSmoke", textDescription: "With relaxing properties, it reduces stress and anxiety and provides a peaceful sleep.",
                 niceMistures: ["Tangerine", "Vanilla"]
                ),
    EssenceModel(value: "Roses", icon: "Rosas",
                 smokeColor: "redSmoke", textDescription: "With a sweet and pleasant aroma, it will be the calming element of the ambience, bringing peace, romanticism and sensuality.",
                 niceMistures: ["Lemon", "Ylang Ylang", "Lavender", "Vanilla", "Coconut"]
                ),
    EssenceModel(value: "Tangerine", icon: "Tangerina",
                 smokeColor:"orangeSmoke",textDescription: "Cheerful aroma, acts as a stimulant, reducing stress and increasing energy to produce.",
                 niceMistures: ["Passion Fruit", "Lemon", "Cinnamon", "Vanilla"]
                ),
    EssenceModel(value: "Lemon", icon: "Limao",
                 smokeColor:"greenSmoke", textDescription: "It has a citrus and light aroma. It promotes concentration in studies and work, as well as improving mood and physical and mental resistance to stress.",
                 niceMistures: ["Mint", "Roses", "Tangerine", "Vanilla", "Ylang Ylang", "Cherry Blossom", "Coconut"]
                ),
    EssenceModel(value: "Cinnamon", icon: "Canela",
                 smokeColor:"brownSmoke",textDescription: "Stimulating aroma that improves mood has great aphrodisiac and anti-inflammatory potential.",
                 niceMistures: ["Passion Fruit", "Roses", "Tangerine", "Vanilla", "Ylang Ylang"]
                ),
    EssenceModel(value: "Vanilla", icon: "Baunilha",
                 smokeColor:"vanillaSmoke",textDescription: "It has a fragrant, sweet and delicate aroma. In aromatherapy, it helps to alleviate the effects of anxiety, nervousness, depression and insomnia.",
                 niceMistures: ["Mint", "Passion Fruit", "Roses", "Tangerine", "Lemon", "Cinnamon", "Lavender", "Ylang Ylang", "Coconut"]
                ),
    EssenceModel(value: "Lavender", icon: "Lavanda",
                 smokeColor: "purpleSmoke",textDescription: "Calms, brings peace and balance to busy ambiences. It also provides regenerating nights sleep.",
                 niceMistures: ["Mint", "Roses", "Vanilla", "Cotton"]
                ),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang",
                 smokeColor:"yellowSmoke",textDescription: "It has aphrodisiac properties and exotic aroma, in addition to decreasing nervous and muscular tension.",
                 niceMistures: ["Mint", "Roses", "Lemon", "Cinnamon", "Vanilla"]
                ),
    EssenceModel(value: "Cotton", icon: "Algodao",
                 smokeColor:"vanillaSmoke",textDescription: "With woody notes, it fights insomnia and transmits freshness to the environment. It also has antidepressant potential.",
                 niceMistures: ["Passion Fruit", "Roses", "Lavender"]
                ),
    EssenceModel(value: "Cherry Blossom", icon: "Cerejeira",
                 smokeColor: "pinkSmoke",textDescription: "With a floral and sweet aroma, it transmits a sensation of comfort and coziness, in addition to acting as a euphoriator. Ideal for romantic ambiences.", niceMistures: ["Lemon"]
                ),
    EssenceModel(value: "Coconut", icon: "Coconut",
                 smokeColor:"brownSmoke",textDescription: "Stimulates well-being. Calms the nerves and promotes spiritual peace. In addition, it has soothing properties for the skin, reducing inflammation and promoting hydration.",
                 niceMistures: ["Roses", "Lemon", "Vanilla"]
                )
    
]

struct ImageElementComponent: View {
    let essence: EssenceModel
    @State var isPopover = false
    
    var body: some View {
        VStack {
            Button(action: { self.isPopover.toggle() }) {
                Image(essence.icon)
                    .resizable()
                    .cornerRadius(900)
                    .frame(width: 90,
                           height: 90, alignment: .leading)
                    .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23, opacity: 0.8), lineWidth: 3))
            }.bottomSheet(isPresented: self.$isPopover, detents: [.medium(), .large()]) {
                PopoverDescription()
            }.buttonStyle(PlainButtonStyle())
        }
        
    }
    
    @ViewBuilder
    func PopoverDescription() -> some View {
        VStack {
            Text(essence.textDescription)
                .padding()
        }
        .padding()
    }
    
}



