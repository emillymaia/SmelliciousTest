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
    
}




var essences_: [EssenceModel] = [
    EssenceModel(value: "Hortelã", icon: "Hortela", smokeColor: "Verde"),
    EssenceModel(value: "Maracujá", icon: "Maracuja", smokeColor: "Amarelo"),
    EssenceModel(value: "Rosas", icon: "Rosas", smokeColor: "Vermelho"),
    EssenceModel(value: "Tangerina", icon: "Tangerina", smokeColor:"Laranja"),
    EssenceModel(value: "Limão", icon: "Limao", smokeColor:"Verde"),
    EssenceModel(value: "Canela", icon: "Canela", smokeColor:"Marrom"),
    EssenceModel(value: "Baunilha", icon: "Baunilha", smokeColor:"Creme"),
    EssenceModel(value: "Lavanda", icon: "Lavanda", smokeColor: "Roxo"),
    EssenceModel(value: "Ylang Ylang", icon: "Ylang", smokeColor:"Amarelo"),
    EssenceModel(value: "Algodão", icon: "Algodao", smokeColor:"Creme"),
    EssenceModel(value: "Flor de Cerejeira", icon: "Cerejeira", smokeColor: "Rosa"),
    EssenceModel(value: "Coco", icon: "Coco", smokeColor:"Marrom")

]
