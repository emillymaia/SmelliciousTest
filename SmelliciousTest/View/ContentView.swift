//
//  ContentView.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 15/09/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators:  false) {
            //LottieView(name: "pink-smoke", loopMode: .loop)
                //.frame(width: 250, height: 250)
            CombineEssencesView()
        }
        //.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
