//
//  WidgetKitCourse_Widget.swift
//  WidgetKitCourse Widget
//
//  Created by Vincent Zhou on 2/24/22.
//

import WidgetKit
import SwiftUI
import Intents


@main
struct WidgetKitCourse_Widget: Widget {
    let kind: String = "WidgetKitCourse_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Todos")
        .description("View your latest todos.")
    }
}

struct WidgetKitCourse_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)]))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            LargeSizeView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)])).previewContext(WidgetPreviewContext(family: .systemLarge))
        }
        
    }
}
