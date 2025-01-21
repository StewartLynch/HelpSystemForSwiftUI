//
//----------------------------------------------
// Original project: HelpSampleApplication
// by  Stewart Lynch on 2025-01-20
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

struct HelpButtonModifier: ViewModifier {
    let currentHelp: HelpType
    @Binding var help: HelpType?
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                Button {
                    help = currentHelp
                } label: {
                    Image(systemName: "questionmark")
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .background(.green, in: .circle)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .padding(.trailing)
            }
            .sheet(item: $help) { help in
                help
            }
    }
}

extension View {
    func helpButton(currentHelp: HelpType, help: Binding<HelpType?>) -> some View {
        modifier(HelpButtonModifier(currentHelp: currentHelp, help: help))
    }
}
