//
//  PhotoDetailViewController.swift
//  TabbedAppExercise
//
//  Created by Milen Pivchev on 12.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    var photo : PhotoElement? = nil
    
    private var comments = Comments()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        photoImage.kf.setImage(with: URL(string: photo!.url))
        photoTitle.text = photo?.title
        
        Api.getComments() { comments, error in
            if let comments = comments {
                self.comments = comments
                
                UIView.transition(with: self.view,
                                  duration: 0.3,
                                  options: [.curveEaseInOut, .transitionCrossDissolve],
                                  animations: {
                                    self.tableView.reloadData()
                }, completion: nil)
            }
        }
    }
}

extension PhotoDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension PhotoDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
                let comment = comments[indexPath.row]
        
        cell.textLabel?.text = comment.body
        
        return cell
    }
}
