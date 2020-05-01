//
//  PhotosViewController.swift
//  TabbedAppExercise
//
//  Created by Milen Pivchev on 10.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PhotosViewController : UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    private var photos = Photos()
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 0, bottom: 50.0, right: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
         
        Api.getPhotos() { photos, error in
            if let photos = photos {
                self.photos = photos
                
                UIView.transition(with: self.view,
                                  duration: 0.3,
                                  options: [.curveEaseInOut, .transitionCrossDissolve],
                                  animations: {
                                    self.collectionView.reloadData()
                }, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoDetail" {
            let controller = segue.destination as! PhotoDetailViewController
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            controller.photo = photos[indexPath!.row]
        }
        
    }
}

extension PhotosViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.row]
        let url = URL(string: photo.thumbnailURL)
        
        cell.imageView.kf.setImage(with: url)
        
        return cell
    }
}

