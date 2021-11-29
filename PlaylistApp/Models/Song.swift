//
//  Song.swift
//  PlaylistApp
//
//  Created by Jonathan Llewellyn on 11/5/21.
//

import Foundation

class Song: Codable {
    let title: String
    let artistName: String
    
    init(title: String, artistName: String) {
        self.title = title
        self.artistName = artistName
    }
    
}

// Add extension with functionality to be equatable, so that the song controller can delete songs from the array

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.artistName == rhs.artistName
    }
}
