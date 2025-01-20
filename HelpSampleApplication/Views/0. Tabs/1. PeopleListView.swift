//
//----------------------------------------------
// Original project: HelpSampleApplication
// by  Stewart Lynch on 2025-01-18
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct PeopleListView: View {
    @Environment(PeopleStore.self) private var store
    @Environment(AppState.self) private var appState
    @State private var formType: PersonFormType?
    @State private var showSettings = false
    var body: some View {
        List(store.people, selection: Bindable(appState).selectedPerson) { person in
            PersonRowView(person: person).tag(person)
                .swipeActions {
                    Button(role: .destructive) {
                        store.delete(person: person)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
        }
        .listStyle(.plain)
        .navigationTitle("People")
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gear")
                }
                Button {
                    formType = .new
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .sheet(item: $formType) { $0 }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

#Preview {
    NavigationStack {
        PeopleListView()
    }
        .environment(PeopleStore())
        .environment(AppState())
}

struct PersonRowView: View {
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(person.firstName) \(person.lastName)")
                .font(.headline)
            Text("Age: \(person.age)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
