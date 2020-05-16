//
//  HeaderView.swift
//  TabbedApp
//
//  Created by Milen Pivchev on 02.05.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    let title = UILabel()
    let image = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initContent()
    }
    
    private func initContent() {
        title.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "image")

        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0)
        ])
        
        image.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
