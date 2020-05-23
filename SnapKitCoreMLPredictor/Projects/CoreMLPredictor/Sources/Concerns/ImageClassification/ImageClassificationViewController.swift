//
//  ImageClassificationViewController.swift
//  CoreMLPredictor
//
//  Created by Milen Pivchev on 23.05.20.
//

import UIKit
import SnapKit

class ImageClassificationViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    
    let imageView = UIImageView()
    let noImageDescription = UILabel()
    
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
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImage))
        button.title = "WOW"
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupContent() {
        // Image view
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // No image description
        view.addSubview(noImageDescription)
        noImageDescription.text = "Press the + button to add an image for classification."
//        noImageDescription.numberOfLines = 0
        noImageDescription.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(16)
//            make.right.equalToSuperview().offset(16)
            
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
            noImageDescription.isHidden = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("YIKES")
        dismiss(animated: true, completion: nil)
    }
}
