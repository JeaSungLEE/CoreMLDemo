//
//  ViewController.swift
//  CoreMLDemo
//
//  Created by jeasung.lee on 2017. 10. 31..
//  Copyright © 2017년 jeasung.lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController {
    @IBAction func buttonAction(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .savedPhotosAlbum
        present(pickerController, animated: true)
    }
    
    func detectScene(image: CIImage) {
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("이미지를 못불러와쪄영")
        }
        
        imageView.image = image
        
        guard let ciImage = CIImage(image: image) else {
            fatalError("변환 실패")
        }
        
        detectScene(image: ciImage)
    }
}

extension ViewController: UINavigationControllerDelegate {
}
