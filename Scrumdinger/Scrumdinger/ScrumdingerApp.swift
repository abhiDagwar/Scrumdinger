//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Abhishek G on 15/04/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
