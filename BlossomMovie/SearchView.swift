//
//  SearchView.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 6/28/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchByMovies = true
    @State private var searchText = ""
    private let searchViewModel = SearchViewModel()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                if let error = searchViewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(searchViewModel.searchTitles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                        .onTapGesture {
                            navigationPath.append(title)
                        }
                    }
                }
            }
            .navigationTitle(searchByMovies ? Constants.movieSearchString : Constants.tvSearchString)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        searchByMovies.toggle()
                        
                        Task {
                            await searchViewModel.getSearchTitles(by: searchByMovies ? "movie" : "tv", for: searchText)
                        }
                        
                    } label: {
                        Image(systemName: searchByMovies ? Constants.movieIconString : Constants.tvIconString)
                    }
                }
            }
            .searchable(text: $searchText, prompt: searchByMovies ? Constants.moviePlaceHolderString : Constants.tvPlaceHolderString)
            .task(id: searchText) {
                try? await Task.sleep(for: .milliseconds(500))
                
                if Task.isCancelled {
                    return
                }
                
                await searchViewModel.getSearchTitles(by: searchByMovies ? "movie" : "tv", for: searchText)
            }
            .navigationDestination(for: Title.self) { title in
                TitleDetailView(title: title)
            }
        }
    }
}

#Preview {
    SearchView()
}
