//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 15/04/25.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {

                Circle()
                    .strokeBorder(lineWidth: 24)
                
                HStack {
                    Text("Speaker 1 of 3”")
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
