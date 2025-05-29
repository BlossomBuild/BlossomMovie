//
//  VerticalListView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 5/28/25.
//

import SwiftUI

struct VerticalListView: View {
    var titles: [Title]
    
    var body: some View {
        List(titles) { title in
            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                HStack {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(5)
                    
                    Text((title.name ?? title.title) ?? "")
                        .font(.system(size: 14))
                        .bold()
                }
            } placeholder: {
                ProgressView()
            }
            .frame(height: 150)
        }
    }
}

#Preview {
    VerticalListView(titles: Title.previewTitles)
}
