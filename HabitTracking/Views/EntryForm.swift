//
//  EntryForm.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import SwiftUI

struct EntryForm: View {
    @Environment(\.dismiss) var dismiss
    @State var activityName = ""
    @State var activityDescription = ""
    @ObservedObject var activity: Activity
    @State var showemptyAlert = false
    @State var showDuplicateAlert = false
    var body: some View {
        Form {
            VStack {
                TextField("Enter the habit", text: $activityName)
                    .padding()
                TextField("Enter the description", text: $activityDescription)
                    .padding()
                Button {
                    
                    let habit = Habit(habitName: activityName, habitDescription: activityDescription, habitCount: 0)
                    
                    if(activityName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                        self.showemptyAlert = true
                    }
                    else
                    {
                        activity.habits.append(habit)
                   //     self.activity.saveActivities()
                        dismiss()
                    }
                }
            label: {
                Text("Save")
                    .font(.body)
                }
            }
            
            .alert( isPresented: $showemptyAlert) {
                Alert(title: Text("Empty Field"), message: Text("Fill habit name"), dismissButton: .cancel())
                
            }
        }
        .alert( isPresented: $showDuplicateAlert) {
            Alert(title: Text("Duplicate Habit"), message: Text("Enter a new habit"), dismissButton: .cancel())
        }
    }
}

struct EntryForm_Previews: PreviewProvider {
    static var previews: some View {
        EntryForm(activity: Activity())
    }
}
