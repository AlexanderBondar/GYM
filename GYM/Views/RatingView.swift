//
//  RatingView.swift
//  SwiftUITutorial
//
//  Created by dev on 14.04.2024.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {  
                        rating = index
                    }
            } }
        .font(.largeTitle)
    }
}

//#Preview {
//    RatingView()
//}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RatingView(rating: .constant(3))
                .previewLayout(.sizeThatFits)
        }
        
    }
}
