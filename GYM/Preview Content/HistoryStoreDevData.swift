//
//  HistoryStoreDevData.swift
//  SwiftUITutorial
//
//  Created by dev on 15.04.2024.
//

import Foundation

extension HistoryStore {
    func createDevData() {
        // Development data
        exerciseDays = [
            ExerciseDay(
                date: Date().addingTimeInterval(-86400),
                exercises: [
                    Exercise.exercises[0].exerciseName,
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[2].exerciseName
                ]),
            ExerciseDay(
                date: Date().addingTimeInterval(-86400 * 2),
                exercises: [
                    Exercise.exercises[1].exerciseName,
                    Exercise.exercises[0].exerciseName
                ])
        ]
    }
    
    convenience init(debugData: Bool) {
      self.init()
      createDevData()
    }
}
