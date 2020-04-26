//
//  HeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by Milen Pivchev on 19.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    var blurAnimator: UIViewPropertyAnimator!
    
    let imageView : UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "958580"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        initBlur()
    }
    
    private func initBlur() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: nil)
        self.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        
        blurAnimator = UIViewPropertyAnimator(duration: 0, curve: .linear, animations: {
            visualEffectView.effect = blurEffect
        })
        
        blurAnimator.pausesOnCompletion = true // enables the effect to remain active after app goes in the background
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
