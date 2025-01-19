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

struct StartTab: View {
    @Environment(PeopleStore.self) var store
    @Environment(AppState.self) var appState
   
    var body: some View {
        TabView {
            Tab("People", systemImage: "person.3") {
                NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                    PeopleListView()
                } detail: {
                    PersonDetail()
                }
                .navigationSplitViewStyle(.balanced)
            }
            Tab("Distribution", systemImage: "chart.bar") {
                DistributionView()
            }
        }
       
    }
}

#Preview {
    StartTab()
        .environment(PeopleStore())
        .environment(AppState())
}
