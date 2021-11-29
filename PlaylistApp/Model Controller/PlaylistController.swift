//
//  PlaylistController.swift
//  PlaylistApp
//
//  Created by Jonathan Llewellyn on 11/7/21.
//

import Foundation


class PlaylistController {
 
    // Shared instance
    static let shared = PlaylistController()
    
    // SOT
    var playlists: [Playlist] = []
    
    // CRUD
    
    // Create a playlist
    func createPlaylist(name:String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistenceStore()
    }
    

    
    
    // Delete a playlist
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistenceStore()
    }
    
    // MARK: - Persistence
    //(updated from SongController to save Playlists, not Songs)
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("PlaylistApp.json")    //Save it to the app name. Take song object and encode it to json data so the OS can read it.
        return fileURL
    }
    
    // Func that Saves Data to Device. Encode song object into JSON data. Need to make song object conform to Codable (update in Song Model)
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: persistentStore())   // Needs the fileURL from the function, so you can just call the function here
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
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        } catch {
            print("We had an error loading our data from the persistence store.")
            print(error)
            print(error.localizedDescription)
        }
    }
    
    
}
