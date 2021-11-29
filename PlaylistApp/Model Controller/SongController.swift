//
//  SongController.swift
//  PlaylistApp
//
//  Created by Jonathan Llewellyn on 11/5/21.
//

import Foundation

class SongController {

    // CRUD: Create, Read, Update, Delete
    
    // Create
   static func createSong(title: String, artistName: String, playlist: Playlist) {
        let newSong = Song(title: title, artistName: artistName)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistenceStore()
    }

    
    // Delete
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return } //Need guard statement to make sure a song is in the array to be deleted.
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
        
    }
    
   /* // MARK: - Persistence
    
    // Persistence Store (need a location to write/load the data to/from)
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("PlaylistApp.json")    //Save it to the app name. Take song object and encode it to json data so the OS can read it.
        return fileURL
    }
    
    // Func that Saves Data to Device. Encode song object into JSON data. Need to make song object conform to Codable (update in Song Model)
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(songs)
            try data.write(to: persistentStore())   // Needs the fileURL from teh function, so you can just call the function here
        } catch {
            print("We had an error saving to our persistence store.")
            print(error)
            print(error.localizedDescription)
        }
    }
    
    
    // Func Load the data from Device
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: persistentStore())
            songs = try JSONDecoder().decode([Song].self, from: data)
        } catch {
            print("We had an error loading our data from the persistence store.")
            print(error)
            print(error.localizedDescription)
        }
    }
    */
    
}

