//
//  CegonhaAdiantadaProvider.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 13/05/23.
//

import WidgetKit

struct CalculusEntry: TimelineEntry {
    let date: Date
    let calculus: Calculus
}

struct CegonhaAdiantadaProvider: TimelineProvider {
    typealias Entry = CalculusEntry
    
    let history = UserDefaults(suiteName: "group.com.givigir.CegonhaAdiantada")?.object(forKey: "history")
    
    func placeholder(in context: Context) -> Entry {
        Entry(date: Date(), calculus: Calculus())
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = Entry(date: Date(), calculus: Calculus())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let results = history as? [Data] ?? []
        let slice = Array(results.prefix(5))
        let calculus = slice.toCalculus().sorted { $0.date > $1.date }
        
        var entries: [Entry] = []
        let currentDate = Date()
        
        calculus.forEach { calculus in
            if let entryDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate) {
                let entry = Entry(date: entryDate, calculus: calculus)
                entries.append(entry)
            }
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
