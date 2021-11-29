//
//  TableViewController.swift
//  PlaylistApp
//
//  Created by Jonathan Llewellyn on 11/5/21.
//

import UIKit

class SongTableViewController: UITableViewController {

    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    // MARK: - Properties
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // Actions: What to do when add button is clicked:
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songTitle = songTitleTextField.text,      // Unwraps text for song name
              let artistName = artistNameTextField.text,    // Unwraps text for artist name
              !songTitle.isEmpty,                           // Makes sure field isn't empty
              !artistName.isEmpty,
              let playlist = playlist else { return }
        
        SongController.createSong(title: songTitle, artistName: artistName, playlist: playlist)
        songTitleTextField.text = ""        // Clears text from text box after adding song
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return playlist?.songs.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist else { return cell }

        let song = playlist.songs[indexPath.row]
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName
        
        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let playlist = playlist else { return }

            let songToDelete = playlist.songs[indexPath.row]   // Location of song to delete
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }   
    }



}
