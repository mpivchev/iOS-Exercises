//
//  HomeViewController.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 16.05.20.
//

import UIKit
import SnapKit

class HomeViewController: UINavigationController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let cellReuseIdentifier = "HomeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationToolbar()
        setupCollectionView()
    }
    
    private func setupNavigationToolbar() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.prefersLargeTitles = true
        navigationBarAppearance.isTranslucent = true
//        navigationBarAppearance.backgroundColor = .white
//        navigationBarAppearance.tintColor = .white
//        navigationBarAppearance.barTintColor = .white
//        navigationBarAppearance.alpha = 0.5
        edgesForExtendedLayout = [.all]
        extendedLayoutIncludesOpaqueBars = true
        
        self.title = "Machine Learning Predictor"
    }
    
    private func setupCollectionView() {
        let cellSize = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = .init(width: cellSize, height: cellSize)
        
        collectionView.backgroundColor = .white
//        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            

//            make.edges.equalToSuperview().inset(60)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
}
