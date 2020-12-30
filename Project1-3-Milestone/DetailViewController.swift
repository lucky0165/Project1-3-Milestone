//
//  DetailViewController.swift
//  Project1-3-Milestone
//
//  Created by Łukasz Rajczewski on 30/12/2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let imageName = selectedImage {
            imageView.image = UIImage(named: imageName)
            title = imageName.uppercased()
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
        
    }
    
    @objc func shareImage() {
        
        guard let imageToShare = selectedImage else {
            return
        }
        
        guard let image = UIImage(named: imageToShare) else { return }
        
        let avc = UIActivityViewController(activityItems: [image, imageToShare], applicationActivities: nil)
        // avc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(avc, animated: true, completion: nil)
        
    }
    
    

}
