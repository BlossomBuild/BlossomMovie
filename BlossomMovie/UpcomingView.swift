//
//  UpcomingView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 5/28/25.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        VerticalListView(titles: Title.previewTitles)
    }
}

#Preview {
    UpcomingView()
}
