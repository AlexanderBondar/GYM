//
//  WelcomeView.swift
//  SwiftUITutorial
//
//  Created by dev on 28.03.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var selectedTab: Int
    
    @State private var showHistory = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "greeting"))
                Spacer()
                Button(NSLocalizedString("History", comment: "view user activity")) {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
            VStack(spacing: 100) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(NSLocalizedString("Get fit", comment: "view user activity"))
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("welcome")
                        .resizedToFill(width: 150, height: 150)
                        .clipShape(Circle())
                }
                Button(action: { selectedTab = 0 }) {
                    Text(NSLocalizedString("Get Started", comment: "invitation"))
                    Image(systemName: "arrow.right.circle")
//                    Label("Get Started", systemImage: "arrow.right.circle")
//                        .labelStyle(.titleAndIcon)
                }
                .font(.title2)
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 20)
                  .stroke(Color.gray, lineWidth: 2)
                )
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
