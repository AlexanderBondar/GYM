//
//  ContainerView.swift
//  GYM
//
//  Created by dev on 22.04.2024.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color("background"))
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(Color("background"))
            }
            content
        }
    }
    
    init(@ViewBuilder content: () -> Content) {
      self.content = content()
    }
}

#Preview {
    ContainerView {
        VStack {
            RaisedButton(buttonText: "Hello World") {}
                .padding(50)
            Button("Tap me!") {}
                .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
    .padding(50)
    .previewLayout(.sizeThatFits)
}
