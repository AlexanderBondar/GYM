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
        HStack {
            ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                let fill = index == selectedTab ? ".fill" : ""
                Image(systemName: "\(index + 1).circle\(fill)")
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
