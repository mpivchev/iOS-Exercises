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
import ImageIO

class ImageClassificationViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    
    let imageView = UIImageView()
    let addImageDescription = UILabel()
    let floatingPanel = UIView()
    let infoLabel = UILabel()
    
    let mobileNet = MobileNetV2()
    
     /// - Tag: MLModelSetup
       lazy var classificationRequest: VNCoreMLRequest = {
           do {
               /*
                Use the Swift class `MobileNet` Core ML generates from the model.
                To use a different Core ML classifier model, add it to the project
                and replace `MobileNet` with that model's generated Swift class.
                */
               let model = try VNCoreMLModel(for: MobileNetV2().model)
               
               let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
               })
               request.imageCropAndScaleOption = .centerCrop
               return request
           } catch {
               fatalError("Failed to load Vision ML model: \(error)")
           }
       }()
    
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
        imageView.contentMode = .scaleToFill
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
        infoLabel.numberOfLines = 0
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
    
    /// - Tag: PerformRequests
     func updateClassifications(for image: UIImage) {
         infoLabel.text = "Classifying..."
         
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue)) else { return }
         guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
         
         DispatchQueue.global(qos: .userInitiated).async {
             let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
             do {
                 try handler.perform([self.classificationRequest])
             } catch {
                 /*
                  This handler catches general image processing errors. The `classificationRequest`'s
                  completion handler `processClassifications(_:error:)` catches errors specific
                  to processing that request.
                  */
                 print("Failed to perform classification.\n\(error.localizedDescription)")
             }
         }
     }
     
     /// Updates the UI with the results of the classification.
     /// - Tag: ProcessClassifications
     func processClassifications(for request: VNRequest, error: Error?) {
         DispatchQueue.main.async {
             guard let results = request.results else {
                 self.infoLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
                 return
             }
             // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
             let classifications = results as! [VNClassificationObservation]
         
             if classifications.isEmpty {
                 self.infoLabel.text = "Nothing recognized."
             } else {
                 // Display top classifications ranked by confidence in the UI.
                 let topClassifications = classifications.prefix(2)
                 let descriptions = topClassifications.map { classification in
                     // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                    return String(format: "  (%.2f) %@", classification.confidence, classification.identifier)
                 }
                 self.infoLabel.text = "Classification:\n" + descriptions.joined(separator: "\n")
             }
         }
     }
}

extension ImageClassificationViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            addImageDescription.isHidden = true
            floatingPanel.isHidden = false
            
            updateClassifications(for: pickedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
