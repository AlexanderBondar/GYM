//
//  RatingView.swift
//  SwiftUITutorial
//
//  Created by dev on 14.04.2024.
//

import SwiftUI

struct RatingView: View {
    
    let exerciseIndex: Int
    
    @AppStorage("ratings") private var ratings = "0000"
    
    @State private var rating = 0
    
    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray
    
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex

        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {

            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {
                        updateRating(index: index)
                    }
                    .onAppear {
                      let index = ratings.index(
                        ratings.startIndex,
                        offsetBy: exerciseIndex)
                      let character = ratings[index]
                      rating = character.wholeNumberValue ?? 0
                    }
            }
        }
        .font(.largeTitle)
    }
    
    func updateRating(index: Int) {
      rating = index
      let index = ratings.index(
        ratings.startIndex,
        offsetBy: exerciseIndex)
      ratings.replaceSubrange(index...index, with: String(rating))
    }
}

//#Preview {
//    RatingView()
//}

struct RatingView_Previews: PreviewProvider {
    @AppStorage("ratings") static var ratings: String?

    static var previews: some View {
          ratings = nil
          return RatingView(exerciseIndex: 0)
            .previewLayout(.sizeThatFits)
        }
    }
