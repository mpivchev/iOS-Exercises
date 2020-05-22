//
//  HomeViewController.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 16.05.20.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let cellReuseIdentifier = "HomeCell"
    private let mlModels = [MLModel(title: "Image classification", image: #imageLiteral(resourceName: "ImageClassification") ), MLModel(title: "Object Detection", image: #imageLiteral(resourceName: "ObjectDetection")), MLModel(title: "Text Scanning", image: #imageLiteral(resourceName: "TextDetection")), MLModel(title: "Pose Estimation", image: #imageLiteral(resourceName: "PoseEstimation") )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationToolbar()
        setupContent()
    }
    
    private func setupNavigationToolbar() {
        self.title = "Machine Learning Predictor"
    }
    
    private func setupContent() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let cellSize = (view.frame.size.width - (layout.minimumLineSpacing + layout.minimumInteritemSpacing) - layout.sectionInset.left - layout.sectionInset.right) / 2
        layout.itemSize = .init(width: cellSize, height: cellSize)
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mlModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        let mlModel = mlModels[indexPath.row]
        
        cell.title.text = mlModel.title
        cell.image.image = mlModel.image
        
        return cell
    }
}
