//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Abhishek G on 15/04/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
