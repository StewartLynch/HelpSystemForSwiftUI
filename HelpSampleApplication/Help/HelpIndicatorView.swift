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

struct HelpIndicatorView: View {
    let pageCount: Int
    @Binding var scrollID: Int?
    var body: some View {
        if pageCount > 1 {
            HStack {
                ForEach(0..<pageCount, id: \.self) { index in
                    let current = scrollID ?? 0
                    Button {
                        withAnimation {
                            scrollID = index
                        }
                    } label: {
                        Image(systemName: "circle.fill")
                            .font(.system(size: index == current ? 12 : 8))
                            .foregroundStyle(index == current ? Color(.lightGray) : .white)
                    }
                }
            }
            .animation(.easeInOut, value: scrollID)
            .padding(7)
            .background(Color(.lightGray).opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    HelpIndicatorView(pageCount: 3, scrollID: .constant(2))
}
