//
//  HeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by Milen Pivchev on 19.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let imageView : UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "RRUe0Mo"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
