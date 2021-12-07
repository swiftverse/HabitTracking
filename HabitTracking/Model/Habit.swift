//
//  Habit.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import Foundation
import SwiftUI

struct Habit: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    let habitName: String
    let habitDescription: String
    var habitCount: Int
}
