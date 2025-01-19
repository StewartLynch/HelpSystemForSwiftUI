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
import Charts

struct DistributionView: View {
    @Environment(PeopleStore.self) private var peopleStore
    var ageDistribution: [(range: String, count: Int)] {
        let ranges = stride(from: 0, through: 80, by: 5).map { start in
            (start...(start + 4))
        }
        
        return ranges.map { range in
            let count = peopleStore.people.filter { range.contains($0.age) }.count
            return ("\(range.lowerBound)-\(range.upperBound)", count)
        }
    }
    
    var body: some View {
        NavigationStack {
            Chart {
                ForEach(ageDistribution, id: \.range) { item in
                    BarMark(
                        x: .value("Age Range", item.range),
                        y: .value("Count", item.count)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisValueLabel {
                        if let label = value.as(String.self) {
                            Text(label)
                                .rotationEffect(.degrees(-45))
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Age Distribution")
        }
    }
}

#Preview {
    DistributionView()
        .environment(PeopleStore())
}
