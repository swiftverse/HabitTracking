//
//  Activity.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import Foundation
import SwiftUI

class Activity: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
}
