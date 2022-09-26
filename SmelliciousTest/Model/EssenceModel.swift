//
//  EssenceModel.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI

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
    EssenceModel(value: "Hortelã", icon: "Hortela",
                 smokeColor: "greenSmoke", textDescription: "Ajuda na concentração e motiva a alta performance nas atividades, além de deixar a respiração mais agradável.",
                 niceMistures: ["Limão", "Lavanda", "Baunilha", "Ylang Ylang"]
                ),
    EssenceModel(value: "Maracujá", icon: "Maracuja",
                 smokeColor: "yellowSmoke", textDescription: "Com propriedades relaxantes, diminui o estresse e a ansiedade e proporciona um sono tranquilo.",
                 niceMistures: ["Tangerina", "Baunilha",]
                ),
    EssenceModel(value: "Rosas", icon: "Rosas",
                 smokeColor: "redSmoke", textDescription: "De aroma doce e agradável,  será o elemento tranquilizador do ambiente, trazendo paz, romantismo e sensualidade.",
                 niceMistures: ["Limão", "Ylang Ylang", "Lavanda", "Baunilha", "Coco"]
                ),
    EssenceModel(value: "Tangerina", icon: "Tangerina",
                 smokeColor:"orangeSmoke",textDescription: "Aroma alegre, age como estimulante, reduzindo o estresse e aumentando a energia para produzir. ",
                 niceMistures: ["Maracujá", "Limão", "Canela", "Baunilha"]
                ),
    EssenceModel(value: "Limão", icon: "Limao",
                 smokeColor:"greenSmoke", textDescription: "Possui aroma cítrico e leve. Promove a concentração nos estudos e no trabalho, além de melhorar o humor e a resistência física e mental ao estresse.",
                 niceMistures: ["Hortelã", "Rosas", "Tangerina", "Baunilha", "Ylang Ylang", "Flor de Cerejeira", "Coco"]
                ),
    EssenceModel(value: "Canela", icon: "Canela",
                 smokeColor:"brownSmoke",textDescription: "Aroma estimulante que melhora o humor tem grande potencial afrodisíaco e anti-inflamatório.",
                 niceMistures: ["Maracujá", "Rosas", "Tangerina", "Baunilha", "Ylang Ylang"]
                ),
    EssenceModel(value: "Baunilha", icon: "Baunilha",
                 smokeColor:"vanillaSmoke",textDescription: "Possui aroma perfumado, doce e delicado. Na aromaterapia, ajuda a amenizar os efeitos da ansiedade, nervosismo, depressão e insônia.",
                 niceMistures: ["Hortelã", "Maracujá", "Rosas", "Tangerina", "Limão", "Canela", "Lavanda", "Ylang Ylang", "Coco"]
                ),
    EssenceModel(value: "Lavanda", icon: "Lavanda",
                 smokeColor: "purpleSmoke",textDescription: "Acalma, traz paz e equilíbrio para ambientes agitados. Também proporciona noites de sono regeneradoras.",
                 niceMistures: ["Hortelã", "Rosas", "Baunilha", "Algodão"]
                ),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang",
                 smokeColor:"yellowSmoke",textDescription: "Possui propriedades afrodisíacas e aroma exótico, além de diminuir a tensão nervosa e muscular.",
                 niceMistures: ["Hortelã", "Rosas", "Limão", "Canela", "Baunilha"]
                ),
    EssenceModel(value: "Algodão", icon: "Algodao",
                 smokeColor:"vanillaSmoke",textDescription: "Com notas amadeiradas, combate a insônia  e transmite frescor ao ambiente. Também tem potencial antidepressivo.",
                 niceMistures: ["Maracujá", "Rosas", "Lavanda"]
                ),
    EssenceModel(value: "Flor de Cerejeira", icon: "Cerejeira",
                 smokeColor: "pinkSmoke",textDescription: "Com aroma floral e adocicado, transmite sensação de conforto e aconchego, além de atuar como euforizante. Ideal para ambientes românticos.", niceMistures: ["Limão"]
                ),
    EssenceModel(value: "Coco", icon: "Coco",
                 smokeColor:"brownSmoke",textDescription: "Estimula o bem estar. Acalma os nervos e promove a paz espiritual. Além disso, possui propriedades calmantes para a pele, reduzindo inflamações e promovendo hidratação.",
                 niceMistures: ["Rosas", "Limão", "Baunilha"]
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
                    .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23), lineWidth: 2))
            }.popover(isPresented: self.$isPopover, arrowEdge: .trailing) {
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



