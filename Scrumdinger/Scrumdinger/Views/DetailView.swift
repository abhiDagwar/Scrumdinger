//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Abhishek G on 16/04/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum: DailyScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Timer", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum, saveEdits: { dailyScrum in
                    scrum = editingScrum
                })
                    .navigationTitle(scrum.title)
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    NavigationStack {
        DetailView(scrum: $scrum)
    }
}
