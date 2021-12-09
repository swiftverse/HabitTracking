//
//  HabitDescription.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import SwiftUI

struct HabitDescription: View {
    @State var habit: Habit
    @State var onStep: Int
    @ObservedObject var activity: Activity
    @Environment(\.dismiss) var dismiss
   
    
    var body: some View {
       
        VStack {
            Text(habit.habitName)
                .font(.title)
                .padding()
            Text(habit.habitDescription)
                .font(.body)
                .padding()
            Stepper("\(onStep) times", value: $onStep, in: 0...1000)
                .padding()
        }
        
        .toolbar {
            Button("save"){
                let index = activity.habits.firstIndex(of: habit)
                activity.habits[index!].habitCount = onStep
               dismiss()
            }
        }
      
        Spacer()
    }
}

struct HabitDescription_Previews: PreviewProvider {
    @State static var habit: Habit = Habit(habitName: "", habitDescription: "", habitCount: 0)
    static var previews: some View {
        HabitDescription(habit: Habit(habitName: "", habitDescription: "", habitCount: 0), onStep: 0, activity: Activity())
    }
}
