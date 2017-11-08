//
//  QRCodeViewController.swift
//  Pass
//
//  Created by Eno Reyes on 11/7/17.
//  Copyright © 2017 Alex K. All rights reserved.
//

import UIKit


class QRCodeViewController: UIViewController {

    @IBOutlet weak var qrCode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = generateQRCode(from: "Hello")
        
        qrCode.image = image
        
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
