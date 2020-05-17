//
//  HomeCollectionViewCell.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 17.05.20.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
