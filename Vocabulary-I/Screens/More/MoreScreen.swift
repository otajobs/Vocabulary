//
//  MoreScreen.swift
//  Vocabulary-I
//
//  Created by Jamoliddinov Abduraxmon on 13/12/24.
//

import SwiftUI
import SwiftData
import Charts

struct MoreScreen: View {
    @Query private var items: [Vocabulary]
    @Query(sort: \Review.date) private var reviews: [Review]
    
    var body: some View {
        Form {
            HStack {
                Text("Vocabulary count")
                Spacer()
                Text("\(items.count)")
            }
            
            Section("Words added") {
                Chart {
                    ForEach(numOfWordsAddedLast7Days()) { item in
                        BarMark(x: .value("Day", item.day), y: .value("Total Count", item.count))
                    }
                }
                .padding(.vertical, 16)
            }
            
            Section("Review count") {
                Chart {
                    ForEach(numOfReviewedWordsLast7Days()) { item in
                        BarMark(x: .value("Day", item.day), y: .value("Total Count", item.count))
                    }
                }
                .padding(.vertical, 16)
            }
            
            Section("review time") {
                Chart {
                    ForEach(numOfMinutesSpentLast7Days()) { item in
                        BarMark(x: .value("Day", item.day), y: .value("Total Count", item.count))
                    }
                }
                .padding(.vertical, 16)
            }
            
            Section("Parser") {
                NavigationLink(destination: ParserScreen()) {
                    Text("Parser")
                }
            }
            
        }
        .navigationTitle("More")
    }
    
    struct ChartItem: Identifiable {
        var id = UUID()
        var day: String
        var count: Int
    }
    
    func numOfWordsAddedLast7Days() -> [ChartItem] {
        var chartItems = [ChartItem]()
        
        for days in stride(from: 6, through: 0, by: -1) {
            if let date = Calendar.current.date(byAdding: .day, value: -days, to: .now) {
                let formatter = DateFormatter()
                formatter.dateFormat = "E"
                let shortDayOfWeek = formatter.string(from: date)
                let count = items.filter { Calendar.current.isDate($0.date, equalTo: date, toGranularity: .day) }.count
                chartItems.append(.init(day: shortDayOfWeek, count: count))
            }
        }
        
        return chartItems
    }
    
    func numOfReviewedWordsLast7Days() -> [ChartItem] {
        var chartItems = [ChartItem]()
        
        for days in stride(from: 6, through: 0, by: -1) {
            if let date = Calendar.current.date(byAdding: .day, value: -days, to: .now) {
                let formatter = DateFormatter()
                formatter.dateFormat = "E"
                let shortDayOfWeek = formatter.string(from: date)
                if let item = reviews.filter({ Calendar.current.isDate($0.date, equalTo: date, toGranularity: .day) }).first {
                    chartItems.append(.init(day: shortDayOfWeek, count: item.numberOfWordsReviewed))
                } else {
                    chartItems.append(.init(day: shortDayOfWeek, count: 0))
                }
            }
        }
        
        return chartItems
    }
    
    func numOfMinutesSpentLast7Days() -> [ChartItem] {
        var chartItems = [ChartItem]()
        
        for days in stride(from: 6, through: 0, by: -1) {
            if let date = Calendar.current.date(byAdding: .day, value: -days, to: .now) {
                let formatter = DateFormatter()
                formatter.dateFormat = "E"
                let shortDayOfWeek = formatter.string(from: date)
                if let item = reviews.filter({ Calendar.current.isDate($0.date, equalTo: date, toGranularity: .day) }).first {
                    chartItems.append(.init(day: shortDayOfWeek, count: item.numberOfSecondsReviewed / 60))
                } else {
                    chartItems.append(.init(day: shortDayOfWeek, count: 0))
                }
            }
        }
        
        return chartItems
    }
}


//#Preview {
//    MoreScreen()
//}
