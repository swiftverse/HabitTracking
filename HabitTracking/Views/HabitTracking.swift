//
//  ContentView.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import SwiftUI

struct HabitTracking: View {
 
    @State var showEntryForm = false
    @ObservedObject var activity: Activity
    var body: some View {
        NavigationView {
            List {
                ForEach(activity.habits) {
                    habit in
                    NavigationLink(destination: HabitDescription(habit: habit, onStep: habit.habitCount, activity: activity)) {
                        Text(habit.habitName)
                        Spacer()
                        Text("Done \(habit.habitCount) times")
                    }
                    
                }
                
                .onDelete(perform: removeItems(at:))
               
            }
            .navigationBarTitle("Habit Tracker")
            
            .toolbar {
                Button {
                    self.showEntryForm = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        
        .sheet(isPresented: $showEntryForm) {
            EntryForm(activity: self.activity)
          
        }
        
       
    }
    
    
    func removeItems(at offsets: IndexSet) {
        activity.habits.remove(atOffsets: offsets)
    }
    
    
   
}

struct HabitTracking_Previews: PreviewProvider {
    static var previews: some View {
        HabitTracking(activity: Activity())
    }
}
