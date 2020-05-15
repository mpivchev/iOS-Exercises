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
        //        let imageView = UIImageView()
        //        imageView.image = #imageLiteral(resourceName: "first")
        //        contentView.addSubview(imageView)
        
        //        imageView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            imageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        //            imageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        //        ])
        
        
        //        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        //        contentView.addSubview(image)
        //        contentView.addSubview(title)
        
        //        title.text = "Title"
        image.image = #imageLiteral(resourceName: "image")
        
        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            //            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            //            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //            image.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            //            image.heightAnchor.constraint(equalToConstant: 50),
            //            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            //            // Center the label vertically, and use it to fill the remaining
            //            // space in the header view.
            //            title.heightAnchor.constraint(equalToConstant: 30),
            //            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            //            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            //            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        let title = UILabel()
        title.text = "Test title"
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
        
        let subtitle = UILabel()
        subtitle.text = "Test subtitle"
        subtitle.font = .systemFont(ofSize: 18)
        subtitle.textColor = .white
        
//        let stackView = UIStackView(arrangedSubviews: [image])
//        stackView.axis = .vertical
//        stackView.backgroundColor = .red
        addSubview(image)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            image.topAnchor.co
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0)
//            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0),
//            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
//            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
        ])
        
        image.fillSuperview()
//        stackView.fillSuperview()
        
        
        
//        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
