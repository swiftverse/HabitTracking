//
//  HabitTrackingApp.swift
//  HabitTracking
//
//  Created by Amit Shrivastava on 07/12/21.
//

import SwiftUI

@main
struct HabitTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            HabitTracking(activity: Activity())
                .preferredColorScheme(.dark)
        }
    }
}
