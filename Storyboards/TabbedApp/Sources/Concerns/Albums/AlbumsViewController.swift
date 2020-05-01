//
//  FirstViewController.swift
//  TabbedAppExercise
//
//  Created by Milen Pivchev on 10.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var albums = Albums()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Api.getAlbums() { albums, error in
            if let albums = albums {
                self.albums = albums
                
                UIView.transition(with: self.view,
                                  duration: 0.3,
                                  options: [.curveEaseInOut, .transitionCrossDissolve],
                                  animations: {
                                    self.tableView.reloadData()
                }, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Albums"
    }
}

extension AlbumsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.title

        return cell
    }
}
