//
//  ImageClassificationViewController.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 23.05.20.
//

import UIKit
import SnapKit
import VisualEffectView
import Vision
import CoreML

class ImageClassificationViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    
    let imageView = UIImageView()
    let addImageDescription = UILabel()
    let floatingPanel = UIView()
    let infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        imagePicker.delegate = self
        
        setupNavigationBar()
        setupContent()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        self.title = "Image Classification"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImage))
    }
    
    private func setupContent() {
        // Image view
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Add image description
        view.addSubview(addImageDescription)
        addImageDescription.text = "Press the + button to add an image for classification."
        addImageDescription.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // Floating panel
        view.addSubview(floatingPanel)
        floatingPanel.backgroundColor = .clear
        floatingPanel.isHidden = true
        floatingPanel.clipsToBounds = true
        floatingPanel.layer.cornerRadius = 8
        
        floatingPanel.snp.makeConstraints{ make in
            make.bottom.right.equalToSuperview().inset(32)
//            make.center.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(200)
        }
        
        
        let blurView = VisualEffectView()
        blurView.colorTint = .darkGray
        blurView.colorTintAlpha = 0.2
        blurView.blurRadius = 10
        blurView.scale = 1
        
        floatingPanel.insertSubview(blurView, at: 0)
        
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Info label
        floatingPanel.addSubview(infoLabel)
        infoLabel.text = "Test"
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
            make.center.equalToSuperview()
        }
    }
    
    @objc private func addImage() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
}

extension ImageClassificationViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            addImageDescription.isHidden = true
            floatingPanel.isHidden = false
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
