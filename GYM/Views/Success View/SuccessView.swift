//
//  SuccessView.swift
//  SwiftUITutorial
//
//  Created by dev on 15.04.2024.
//

import SwiftUI

struct SuccessView: View {
    
    @Binding var selectedTab: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                .foregroundStyle(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .bold()
                Text("Good job completing all four exercises!\nRemember tomorrow another day\nSo eat well and get some rest.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
            }
            
            VStack {
                Spacer()
                Button("Continue") {
                    selectedTab = 9
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
}
