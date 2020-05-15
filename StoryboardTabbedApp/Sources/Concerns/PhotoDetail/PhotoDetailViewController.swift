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
    @IBOutlet weak var tableView: UITableView!
    private var headerView: HeaderView?
    
    var photo : PhotoElement? = nil
    
    private var comments = Comments()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        initHeader()
        
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
    
    private func initHeader() {
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! HeaderView
        tableView.tableHeaderView = headerView
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerView.layoutIfNeeded()
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
    
    //        // Create a standard header that includes the returned text.
    //        func tableView(_ tableView: UITableView, titleForHeaderInSection
    //                                    section: Int) -> String? {
    //           return "Header \(section)"
    //        }
    //
    //        // Create a standard footer that includes the returned text.
    //        func tableView(_ tableView: UITableView, titleForFooterInSection
    //                                    section: Int) -> String? {
    //           return "Footer \(section)"
    //        }
    //
    //        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //            .init(340)
    //        }
    //
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
    //                    "sectionHeader") as! HeaderView
    //        view.title.text = sections[section]
    //        view.image.image = UIImage(named: sectionImages[section])
    //
    //        return view
    //    }
    
}
