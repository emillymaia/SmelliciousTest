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
    var image: Image {
        Image(icon)
    }
    var niceMistures: [String] = []
}


var essences_: [EssenceModel] = [
    EssenceModel(value: "Hortelã", icon: "Hortela",
                 smokeColor: "greenSmoke", niceMistures: ["Limão", "Lavanda", "Baunilha", "Ylang Ylang"]
                ),
    EssenceModel(value: "Maracujá", icon: "Maracuja",
                 smokeColor: "yellowSmoke", niceMistures: ["Tangerina", "Baunilha",]
                ),
    EssenceModel(value: "Rosas", icon: "Rosas",
                 smokeColor: "redSmoke", niceMistures: ["Limão", "Ylang Ylang", "Lavanda", "Baunilha", "Coco"]
                ),
    EssenceModel(value: "Tangerina", icon: "Tangerina",
                 smokeColor:"orangeSmoke", niceMistures: ["Maracujá", "Limão", "Canela", "Baunilha"]
                ),
    EssenceModel(value: "Limão", icon: "Limao",
                 smokeColor:"greenSmoke", niceMistures: ["Hortelã", "Rosas", "Tangerina", "Baunilha", "Ylang Ylang", "Flor de Cerejeira", "Coco"]
                ),
    EssenceModel(value: "Canela", icon: "Canela",
                 smokeColor:"brownSmoke", niceMistures: ["Maracujá", "Rosas", "Tangerina", "Baunilha", "Ylang Ylang"]
                ),
    EssenceModel(value: "Baunilha", icon: "Baunilha",
                 smokeColor:"vanillaSmoke", niceMistures: ["Hortelã", "Maracujá", "Rosas", "Tangerina", "Limão", "Canela", "Lavanda", "Ylang Ylang", "Coco"]
                ),
    EssenceModel(value: "Lavanda", icon: "Lavanda",
                 smokeColor: "purpleSmoke", niceMistures: ["Hortelã", "Rosas", "Baunilha", "Algodão"]
                ),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang",
                 smokeColor:"yellowSmoke", niceMistures: ["Hortelã", "Rosas", "Limão", "Canela", "Baunilha"]
                ),
    EssenceModel(value: "Algodão", icon: "Algodao",
                 smokeColor:"vanillaSmoke", niceMistures: ["Maracujá", "Rosas", "Lavanda"]
                ),
    EssenceModel(value: "Flor de Cerejeira", icon: "Cerejeira",
                 smokeColor: "pinkSmoke", niceMistures: ["Limão"]
                ),
    EssenceModel(value: "Coco", icon: "Coco",
                 smokeColor:"brownSmoke", niceMistures: ["Rosas", "Limão", "Baunilha"]
                )

]

struct ImageElementComponent: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .cornerRadius(900)
            .frame(width: 90,
                   height: 90, alignment: .leading)
            .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23), lineWidth: 2))
    }
}
