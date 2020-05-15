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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initImageView()
        initBlur()
        initGradientLayer()
        initText()
    }
    
    private func initImageView() {
        let imageView : UIImageView = {
            let iv = UIImageView(image: #imageLiteral(resourceName: "958580"))
            iv.contentMode = .scaleAspectFill
            return iv
        }()
        
        addSubview(imageView)
        imageView.fillSuperview()
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
    
    private func initGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = bounds
        gradientLayer.frame.origin.y -= bounds.height
    }
    
    private func initText() {
        let title = UILabel()
        title.text = "Test title"
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.textColor = .white
        
        let subtitle = UILabel()
        subtitle.text = "Test subtitle"
        subtitle.font = .systemFont(ofSize: 18)
        subtitle.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [title, subtitle])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
