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

struct Person: Identifiable, Hashable {
    var id: UUID
    var firstName: String
    var lastName: String
    var age: Int
    
    static var sample: Person = Person(
        id: Self.sampleID,
        firstName: "Stewart",
        lastName: "Lynch",
        age: 73
    )
    
    static var sampleID: UUID = UUID(
        uuidString: "5d6fe059-70b7-49fc-a5e5-4bbc259b2cc5")!
}
