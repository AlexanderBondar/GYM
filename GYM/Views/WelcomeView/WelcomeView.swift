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
    
    var getStartedButton: some View {
        RaisedButton(buttonText: NSLocalizedString("Get Started", comment: "invitation")) {
            selectedTab = 0
        }
        .padding()
    }
    
    var historyButton: some View {
        Button(
            action: {
                showHistory = true
            }, label: {
                Text(NSLocalizedString("History", comment: "view user activity"))
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
    
    //    var body: some View {
    //        ZStack {
    //            VStack {
    //                HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "greeting"))
    //                Spacer()
    //                historyButton
    //                  .sheet(isPresented: $showHistory) {
    //                    HistoryView(showHistory: $showHistory)
    //                  }
    //            }
    //            VStack(spacing: 100) {
    //                HStack(alignment: .bottom) {
    //                    VStack(alignment: .leading) {
    //                        Text(NSLocalizedString("Get fit", comment: "view user activity"))
    //                            .font(.largeTitle)
    //                        Text("with high intensity interval training")
    //                            .font(.headline)
    //                    }
    //                    Image("welcome")
    //                        .resizedToFill(width: 150, height: 150)
    //                        .clipShape(Circle())
    //                }
    //                getStartedButton
    //
    ////                .background(
    ////                  RoundedRectangle(cornerRadius: 20)
    ////                  .stroke(Color.gray, lineWidth: 2)
    ////                )
    //            }
    //        }
    //    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                Spacer()
                
                ContainerView {
                    VStack {
                        WelcomeView.images
                        WelcomeView.welcomeText
                        getStartedButton
                        Spacer()
                        historyButton
                            .sheet(isPresented: $showHistory) {
                                HistoryView(showHistory: $showHistory)
                            }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
