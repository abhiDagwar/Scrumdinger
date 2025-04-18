//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 16/04/25.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    
    let saveEdits: (DailyScrum) -> Void
    
    @State private var attendeeName = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble , in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attenddes")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                TextField("New Attendee", text: $attendeeName)
                Button(action: {
                    withAnimation {
                        let attendee = DailyScrum.Attendee(name: attendeeName)
                        scrum.attendees.append(attendee)
                        attendeeName = ""
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .accessibilityLabel("Add Attendee")
                }
                .disabled(attendeeName.isEmpty)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    saveEdits(scrum)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum, saveEdits: { _ in })
}
