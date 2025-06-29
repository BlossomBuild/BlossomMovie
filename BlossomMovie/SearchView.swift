//
//  SearchView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 6/28/25.
//

import SwiftUI

struct SearchView: View {
    var titles = Title.previewTitles
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                ForEach(titles) { title in
                    AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 200)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
