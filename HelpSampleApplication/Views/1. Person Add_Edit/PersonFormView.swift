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

struct PersonFormView: View {
    @Environment(AppState.self) var appState
    @Environment(PeopleStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    @State var model: PersonFormModel
    @State private var help: HelpType?
    
    var body: some View {
        Form {
            Section("Personal Information") {
                TextField("First Name", text: $model.firstName)
                TextField("Last Name", text: $model.lastName)
                Stepper("Age: \(model.age)", value: $model.age, in: 0...120)
            }
        }
        .navigationTitle(model.person == nil ? "Add Person" : "")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    model.person?.firstName = model.firstName
                    model.person?.lastName = model.lastName
                    model.person?.age = model.age
                    if let person = model.person {
                        // Edit existing person
                        store.update(id: person.id, person: person)
                    } else {
                        // Create new person
                        let newPerson = Person(id: UUID(), firstName: model.firstName, lastName: model.lastName, age: model.age)
                        store.people.append(newPerson)
                    }
                    dismiss()
                }
                .disabled(model.firstName.isEmpty || model.lastName.isEmpty)
            }
        }
        .inNavStack(inNavigation: !model.isUpdating)
        .helpButton(currentHelp: model.isUpdating ? .personEdit : .personAdd, help: $help)
    }
}

#Preview {
    NavigationStack{
        PersonFormView(model: PersonFormModel(person: Person.sample))
    }
        .environment(PeopleStore())
        .environment(AppState())
}


struct InNavStack: ViewModifier {
    var inNavigation: Bool
    func body(content: Content) -> some View {
        if inNavigation {
            NavigationStack {
                content
            }
        } else {
            content
        }
    }
}

extension View {
    func inNavStack(inNavigation: Bool) -> some View {
        modifier(InNavStack(inNavigation: inNavigation))
    }
}
