//
//  YoutubeSearchResponse.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 4/30/25.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties?
}

struct IdProperties: Codable {
    let videoId: String?
}
