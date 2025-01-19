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

struct PersonDetail: View {
    @Environment(AppState.self) private var appState
    var body: some View {
        Group {
            if appState.selectedPerson == nil {
                ContentUnavailableView("Select a Person", systemImage: "person")
            } else {
                PersonFormType.update(appState.selectedPerson!)
                    .id(appState.selectedPerson)
            }
        }
    }
}

#Preview {
    PersonDetail()
        .environment(AppState())
}
