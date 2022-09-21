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
            CombineEssencesView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
