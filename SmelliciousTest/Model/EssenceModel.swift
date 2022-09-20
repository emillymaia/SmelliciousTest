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
    EssenceModel(value: "Hortelã", icon: "Hortela", smokeColor: "greenSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Maracujá", icon: "Maracuja", smokeColor: "yellowSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Rosas", icon: "Rosas", smokeColor: "redSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Tangerina", icon: "Tangerina", smokeColor:"orangeSmoke", niceMistures: ["Rosas", "Maracujá"]),
    EssenceModel(value: "Limão", icon: "Limao", smokeColor:"greenSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Canela", icon: "Canela", smokeColor:"brownSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Baunilha", icon: "Baunilha", smokeColor:"vanillaSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Lavanda", icon: "Lavanda", smokeColor: "purpleSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang", smokeColor:"yellowSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Algodão", icon: "Algodao", smokeColor:"vanillaSmoke", niceMistures: ["Maracujá", "Rosas"]),
    EssenceModel(value: "Flor de Cerejeira", icon: "Cerejeira", smokeColor: "pinkSmoke", niceMistures: ["Maracujá", "Ylang Ylang"]),
    EssenceModel(value: "Coco", icon: "Coco", smokeColor:"brownSmoke", niceMistures: ["Maracujá", "Coco"])

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
