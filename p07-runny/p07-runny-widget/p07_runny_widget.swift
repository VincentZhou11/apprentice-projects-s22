//
//  p07_runny_widget.swift
//  p07-runny-widget
//
//  Created by Vincent Zhou on 3/8/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), milesRan: 0.0, milesDelta: 0.0, milesDate: Date(timeIntervalSince1970: 0.0), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), milesRan: 0.0, milesDelta: 0.0, milesDate: Date(timeIntervalSince1970: 0.0), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles(), milesDelta: MilesRanStore.fetchDeltaMiles(), milesDate: MilesRanStore.fetchMilesDate(), configuration: configuration)

        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let milesRan: Double
    let milesDelta: Double
    let milesDate: Date
    let configuration: ConfigurationIntent
}

struct p07_runny_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
//        Text(entry.date, style: .time)
        VStack {
            Text("Miles Ran:")
            Text("\(entry.milesRan, specifier: "%.2f")").font(.largeTitle)
            HStack {
                Image(systemName: entry.milesDelta >= 0 ? "chevron.up" : "chevron.down").foregroundColor(entry.milesDelta >= 0 ? Color.green : Color.red)
                Text("\(entry.milesDelta, specifier: "%.2f")").font(.subheadline).foregroundColor(entry.milesDelta >= 0 ? Color.green : Color.red)
            }
            Text(entry.milesDate.formatted(Date.FormatStyle().month().day().year())).font(.caption)
        }
    }
}

@main
struct p07_runny_widget: Widget {
    let kind: String = "p07_runny_widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            p07_runny_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("Runny Widget")
        .supportedFamilies([.systemSmall,.systemMedium])
        .description("Keeps track of miles.")
    }
}

struct p07_runny_widget_Previews: PreviewProvider {
    static var previews: some View {
        p07_runny_widgetEntryView(entry: SimpleEntry(date: Date(), milesRan: 4.92,  milesDelta: 3.2, milesDate: Date(), configuration: ConfigurationIntent()))
            .preferredColorScheme(.dark)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
