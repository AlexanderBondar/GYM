//
//  ExerciseView.swift
//  SwiftUITutorial
//
//  Created by dev on 28.03.2024.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    
    @Binding var selectedTab: Int
    
    @State private var showHistory = false
    @State private var showSuccess = false
    
    let index: Int

    @State private var timerDone = false
    @State private var showTimer = false
    
    @EnvironmentObject var history: HistoryStore
    
    var lastExercise: Bool {
      index + 1 == Exercise.exercises.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(
                    forResource: Exercise.exercises[index].videoName,
                    withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn’t find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
      
                HStack(spacing: 100) {
                    Button(NSLocalizedString("Start Exercise", comment: "start exercise")) { 
                        showTimer.toggle()
                    }
                    Button(NSLocalizedString("Done", comment: "complete exercise")) {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timerDone = false
                        showTimer.toggle()
                        if lastExercise {
                            showSuccess.toggle()
                            selectedTab = 9
                        } else {
                            selectedTab += 1
                        }
                    }
                    .disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                if showTimer {
                    TimerView(timerDone: $timerDone)
                }
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                
                
                
                Button(NSLocalizedString("History", comment: "view user activity")) {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(3), index: 3)
        .environmentObject(HistoryStore())
}
