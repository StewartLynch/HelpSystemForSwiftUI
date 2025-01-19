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
class PersonFormModel {
    var person: Person?
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 18
    
    var isUpdating: Bool {
        person != nil
    }
    
    init() {
        
    }
    
    init(person: Person) {
        self.person = person
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.age = person.age
    }
}
