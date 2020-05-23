//
//  HomeCollectionViewCell.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 17.05.20.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    var title = UILabel()
    var image = UIImageView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
    }
    
    private func setupContent() {
        //Title
        contentView.addSubview(title)
        title.textColor = .black

        title.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // Image
        contentView.addSubview(image)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        
        image.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(title.snp.top)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
