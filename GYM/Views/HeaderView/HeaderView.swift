//
//  HeaderView.swift
//  SwiftUITutorial
//
//  Created by dev on 02.04.2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    
    let titleText: String
    
    var body: some View {
      VStack {
        Text(titleText)
          .font(.largeTitle)
          .fontWeight(.black)
          .foregroundColor(.white)
        HStack {
            ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                ZStack {
                  Circle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .opacity(index == selectedTab ? 0.5 : 0)
                  Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.white)
                }
                .onTapGesture {
                  selectedTab = index
                }
            }
    }
        .font(.title2)
      }
    }
}

//#Preview("HeaderView") {
//    HeaderView(exerciseName: "Gerb")
//}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(selectedTab: .constant(0), titleText: "Gerb")
                .previewLayout(.sizeThatFits)
            HeaderView(selectedTab: .constant(1), titleText: "Grib")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
