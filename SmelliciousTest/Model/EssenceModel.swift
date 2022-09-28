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
    var badMisture: String
    var image: Image {
        Image(icon)
    }
    var niceMistures: [String] = []
}


var essences_: [EssenceModel] = [
    EssenceModel(value: "Lavender", icon: "Lavanda",
                 smokeColor: "purpleSmoke",textDescription: "Calms, brings peace and balance to busy ambiences. It also provides regenerating nights sleep.", badMisture: "Lavender is a floral scent, combine it with woody elements and see what a success!",
                 niceMistures: ["Cinnamon", "Cotton", "Vanilla", "Lemon"]
                ),
    EssenceModel(value: "Passion Fruit", icon: "Maracuja",
                 smokeColor: "yellowSmoke", textDescription: "With relaxing properties, it reduces stress and anxiety and provides a peaceful sleep.", badMisture: "Because it is a citrus aroma, passion fruit combines more with woody or menthol essences. Try these combinations and it will be a hit!",
                 niceMistures: ["Cinnamon", "Cotton", "Peppermint", "Vanilla", "Coconut"]
                ),
    EssenceModel(value: "Coconut", icon: "Coco",
                 smokeColor:"brownSmoke",textDescription: "Stimulates well-being. Calms the nerves and promotes spiritual peace. In addition, it has soothing properties for the skin, reducing inflammation and promoting hydration.", badMisture: "Coconut is a sweet fruity essence. Try combining it with more acidic elements.",
                 niceMistures: ["Lemon", "Passion Fruit", "Tangerine", "Cherry Blossom"]
                ),
    EssenceModel(value: "Tangerine", icon: "Tangerina",
                 smokeColor:"orangeSmoke",textDescription: "Cheerful aroma, acts as a stimulant, reducing stress and increasing energy to produce.", badMisture: "Being citrusy, tangerine goes well with minty, sweety or woody essences. Try these combinations, you will love it!",
                 niceMistures: ["Cinnamon", "Vanilla", "Cotton", "Peppermint", "Coconut"]
                ),
    EssenceModel(value: "Cherry Blossom", icon: "Cerejeira",
                 smokeColor: "pinkSmoke",textDescription: "With a floral and sweet aroma, it transmits a sensation of comfort and coziness, in addition to acting as a euphoriator. Ideal for romantic ambiences.", badMisture: "As it is a very sweet floral scent, combine with a very citrusy element to balance", niceMistures: ["Lemon", "Passion Fruit", "Tangerine"]
                ),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang",
                 smokeColor:"yellowSmoke",textDescription: "It has aphrodisiac properties and exotic aroma, in addition to decreasing nervous and muscular tension.", badMisture: "Ylang Ylang is a floral element, try it with woody elements and discover your new passion!",
                 niceMistures: ["Cotton", "Cinnamon", "Vanilla"]
                ),
    EssenceModel(value: "Vanilla", icon: "Baunilha",
                 smokeColor:"vanillaSmoke",textDescription: "It has a fragrant, sweet and delicate aroma. In aromatherapy, it helps to alleviate the effects of anxiety, nervousness, depression and insomnia.", badMisture: "Because it is a sweet aroma, vanilla should be combined with citrus or floral aromas for a better result.",
                 niceMistures: ["Passion Fruit", "Roses", "Tangerine", "Lemon", "Lavender", "Ylang Ylang"]
                ),
    EssenceModel(value: "Peppermint", icon: "Hortela",
                 smokeColor: "greenSmoke", textDescription: "It helps with concentration and motivates high performance in activities, as well as making breathing more pleasant due to the menthol aroma.", badMisture: "Peppermint is a minty scent, it works best with citrus and woody essences.",
                 niceMistures: ["Passion Fruit", "Lemon", "Tangerine", "Cinnamon", "Cotton"]
                ),
    EssenceModel(value: "Cinnamon", icon: "Canela",
                 smokeColor:"brownSmoke",textDescription: "Stimulating aroma that improves mood has great aphrodisiac and anti-inflammatory potential.", badMisture: "Cinnamon is a woody element. Combine with flower essences and see the magic!",
                 niceMistures: ["Roses", "Lavender", "Ylang Ylang", "Lemon", "Passion Fruit", "Tangerine", "Peppermint"]
                ),
    EssenceModel(value: "Cotton", icon: "Algodao",
                 smokeColor:"vanillaSmoke",textDescription: "With woody notes, it fights insomnia and transmits freshness to the environment. It also has antidepressant potential.", badMisture: "Because it has a woody scent, cotton works best with a floral element. Try this!",
                 niceMistures: ["Ylang Ylang", "Roses", "Lavender", "Peppermint", "Passion Fruit", "Tangerine", "Lemon"]
                ),
    EssenceModel(value: "Lemon", icon: "Limao",
                 smokeColor:"greenSmoke", textDescription: "It has a citrus and light aroma. It promotes concentration in studies and work, as well as improving mood and physical and mental resistance to stress.", badMisture: "Due to its citricity, lemon goes well with sweet, floral or woody essences. Try one of these combinations, you will love it!",
                 niceMistures: ["Roses", "Vanilla", "Ylang Ylang", "Cherry Blossom", "Coconut", "Lavender", "Cinnamon", "Cotton", "Tangerine", "Peppermint"]
                ),
    EssenceModel(value: "Roses", icon: "Rosas",
                 smokeColor: "redSmoke", textDescription: "With a sweet and pleasant aroma, it will be the calming element of the ambience, bringing peace, romanticism and sensuality.", badMisture: "Floral aromas match with woody essences. Try to combine and see what success!",
                 niceMistures: ["Cotton" , "Cinnamon", "Vanilla", "Lemon"]
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
                ZStack {
                    Color.init(red: 0.89, green: 0.88, blue: 0.99)
                    EssenceDescription(essence: essence)
                }
                .ignoresSafeArea()
  
            }.buttonStyle(PlainButtonStyle())
        }
        
    }
    
}

struct EssenceDescription: View {
    let essence: EssenceModel
    
    var body: some View {
        VStack(spacing: .zero) {
            Text(essence.value)
                .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))
                .font(.system(.title, design: .rounded))
                .padding()
            
            Image(essence.icon)
                .resizable()
                .cornerRadius(100)
                .frame(width: 100,
                       height: 100, alignment: .leading)
                .padding()

          
            Text(essence.textDescription)
                .font(.system(.title2, design: .rounded))
                .foregroundColor(Color.init( red: 0.19, green: 0.28, blue: 0.23))

            Spacer()
        }
        .padding()
        .multilineTextAlignment(.center)
        .background(Color.init(red: 0.89, green: 0.88, blue: 0.99))
    }
}
