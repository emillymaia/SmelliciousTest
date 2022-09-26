//
//  CombineEssencesViewModel.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import Algorithms


func Difusor() -> some View {
    Image("Difusor")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 224, height: 146, alignment: .center)
}

func Mancha() -> some View {
    Image("mancha")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 284, height: 213, alignment: .center)
}

@ViewBuilder
func DropArea(essence: EssenceModel? = nil, completion: @escaping (String) -> Void) -> some View {
    Image(essence?.icon ?? "")
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23, opacity: 0.8), lineWidth: 3))
        .onDrop(of: [.url], isTargeted: .constant(false)) { providers in
            if let first = providers.first {
                let _ =  first.loadObject(ofClass: URL.self) { value, error in
                    guard let url = value else{return}
                    completion(url.absoluteString)
                }
            }
            
            return false
        }
    
}

@ViewBuilder
func DropArea2(essence: EssenceModel? = nil,completion: @escaping (String) -> Void) -> some View {
    Image(essence?.icon ?? "")
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.init( red: 0.19, green: 0.28, blue: 0.23, opacity: 0.8), lineWidth: 3)
        )
        .onDrop(of: [.url], isTargeted: .constant(false)) { providers in
            if let first = providers.first {
                let _ =  first.loadObject(ofClass: URL.self) { value, error in
                    guard let url = value else{return}
                    completion(url.absoluteString)
                }
            }
            
            return false
        }
    
}



