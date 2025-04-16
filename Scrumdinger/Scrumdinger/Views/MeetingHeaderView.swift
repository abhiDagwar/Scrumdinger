//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 16/04/25.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 0 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.filled")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.filled")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
            
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180)
}
