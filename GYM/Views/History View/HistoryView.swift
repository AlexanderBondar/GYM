//
//  HistoryView.swift
//  SwiftUITutorial
//
//  Created by dev on 14.04.2024.
//

import SwiftUI

struct HistoryView: View {

    enum LayoutType {
      case list, bar
    }
    
    @Binding var showHistory: Bool

    @State var layoutType = LayoutType.list

    @EnvironmentObject var history: HistoryStore
    @Environment(\.presentationMode) var presentationMode

    var closeButton: some View {
        ZStack(alignment: .topTrailing) {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                // swiftlint:disable:next multiple_closures_with_trailing_closure
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
            }
            .font(.title2)
            .padding([.top, .trailing], 25)
        }
    }
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                closeButton
                VStack {
                    VStack {
                        Text(NSLocalizedString("History", comment: "view user activity"))
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        layout
                    }
                    .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    if layoutType == .list {
                        HistoryListView()
                    } else {
                        HistoryBarView()
                    }
                }
            }
        }
    }
    
    var layout: some View {
        HStack {
            if layoutType == .list {
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                })
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
            } else {
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                })
                .buttonStyle(EmbossedButtonStyle())
            }
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
        .environmentObject(HistoryStore(debugData: true))
}
