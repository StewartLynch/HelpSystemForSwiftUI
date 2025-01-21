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

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let pages: [HelpPage]
    @State private var scrollID: Int?
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            let page = pages[index]
                            VStack {
                                if let image = page.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .clipped()
                                        .padding()
                                }
                                Text(page.title)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                ScrollView {
                                    Text(page.text)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .contentMargins(15, for: .scrollContent)
                                Spacer()
                            }
                            .padding()
                            .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.paging)
                HelpIndicatorView(pageCount: pages.count, scrollID: $scrollID)
                    .padding(.bottom)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
    }
}

#Preview {
    HelpView(title: HelpType.peopleList.title, pages: HelpType.peopleList.pages)
}
