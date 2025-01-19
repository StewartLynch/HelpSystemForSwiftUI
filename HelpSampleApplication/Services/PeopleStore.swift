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

import Foundation

@Observable
class PeopleStore {
    var people: [Person] = []
    
    init() {
        // Same mock data initialization
        let firstNames = ["John", "Emma", "Michael", "Sophia", "William", "Olivia", "James", "Ava", "Robert", "Isabella"]
        let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]
        
        for _ in 1...50 {
            let firstName = firstNames.randomElement()!
            let lastName = lastNames.randomElement()!
            let age = Int.random(in: 1...80)
            people.append(Person(id: UUID(), firstName: firstName, lastName: lastName, age: age))
        }
        people.append(Person.sample)
    }
    
    func update(id: Person.ID, person: Person) {
        let personIndex = people.firstIndex(where: {$0.id == id})
        if let personIndex {
            people[personIndex].firstName = person.firstName
            people[personIndex].lastName = person.lastName
            people[personIndex].age = person.age
        }
    }
    
    func person(id: Person.ID?) -> Person? {
        guard let id else { return nil }
        return people.first(where: {$0.id == id })
    }
}
