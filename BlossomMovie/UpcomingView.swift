//
//  UpcomingView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 5/28/25.
//

import SwiftUI

struct UpcomingView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            switch viewModel.upcomingStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView()
                    .frame(width: geo.size.width, height: geo.size.height)
            case .success:
                VerticalListView(titles: viewModel.upcomingMovies)
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
            }
        }
        .task {
            await viewModel.getUpcomingMovies()
        }
        
    }
}

#Preview {
    UpcomingView()
}
