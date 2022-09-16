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
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 19
    var isShowing: Bool = false
    var image: Image {
        Image(icon)
    }
}




var essences_: [EssenceModel] = [
    EssenceModel(value: "Hortelã", icon: "Hortela"),
    EssenceModel(value: "Maracujá", icon: "Maracuja" ),
    EssenceModel(value: "Rosas", icon: "Rosas"),
    EssenceModel(value: "Tangerina", icon: "Tangerina"),
    EssenceModel(value: "Limão", icon: "Limao"),
    EssenceModel(value: "Canela", icon: "Canela"),
    EssenceModel(value: "Baunilha", icon: "Baunilha"),
    EssenceModel(value: "Lavanda", icon: "Lavanda"),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang"),
    EssenceModel(value: "Algodão", icon: "Algodao"),
    EssenceModel(value: "Flor de Cerejeira", icon: "Cerejeira"),
    EssenceModel(value: "Coco", icon: "Coco")
]
