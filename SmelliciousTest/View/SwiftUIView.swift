//
//  SwiftUIView.swift
//  SmelliciousTest
//
//  Created by Emilly Maia on 16/09/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var isShowingPopover = false
    
    var body: some View {
        ZStack {
            Color.black
            Button("Show") {
                withAnimation {
                    isShowingPopover = true
                }
            }
        }
        .overlay {
            if isShowingPopover {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.green)
                    .frame(width: 200, height: 200)
                    .overlay {
                        Button("Dismiss") {
                            withAnimation {
                                isShowingPopover = false
                            }
                        }
                    }
                    .transition(.move(edge: .top))
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
