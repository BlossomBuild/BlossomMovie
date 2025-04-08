//
//  TitleDetailView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 4/3/25.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title
    
    var body: some View {
       GeometryReader { geometry in
           ScrollView {
               LazyVStack(alignment: .leading) {
                   AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                       image
                           .resizable()
                           .scaledToFit()
                   } placeholder: {
                       ProgressView()
                   }
                   .frame(width: geometry.size.width, height: geometry.size.height * 0.85)
                   
                   Text((title.name ?? title.title) ?? "")
                       .bold()
                       .font(.title2)
                       .padding(5)
                       .padding(.top, -20)
                   
                   Text(title.overview ?? "")
                       .padding(5)
               }
           }
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
