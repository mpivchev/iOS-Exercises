//
//  StretchyHeaderFlowLayout.swift
//  StretchyHeaderCollectionView
//
//  Created by Milen Pivchev on 24.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class StretchyHeaderFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
            
                if (contentOffsetY > 0) { return }
                
                let height = attributes.frame.height - contentOffsetY
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: attributes.frame.width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
