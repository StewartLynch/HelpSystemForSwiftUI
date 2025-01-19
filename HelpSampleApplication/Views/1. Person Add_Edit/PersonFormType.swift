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

enum PersonFormType: Identifiable, View {
    case new
    case update(Person)
    
    var id: String {
        String(describing: self)
    }
    
    var body: some View {
        switch self {
            case .new:
                PersonFormView(model: PersonFormModel())
            case .update(let person):
                PersonFormView(model: PersonFormModel(person: person))
                                
        }
    }
}
