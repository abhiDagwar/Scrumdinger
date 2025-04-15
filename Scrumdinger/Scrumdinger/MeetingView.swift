//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 15/04/25.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.tophalf.filled")
                }
                VStack {
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.bottomhalf.filled")
                }
            }
        }
    }
}

#Preview {
    MeetingView()
}
