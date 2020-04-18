//
//  ViewController.swift
//  ScreenCapture
//
//  Created by Senthil on 18/04/20.
//  Copyright © 2020 Senthil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var screenImageView: UIImageView!
    
    @IBAction func ScreenCapture_TouchUpInside(_ sender: Any) {
      
        screenImageView.image = getScreenshot()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        screenImageView.layer.borderWidth = 2.0
        screenImageView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    
    //MARK: Take ScreenShot
    func getScreenshot() -> UIImage? {
        //creates new image context with same size as view
        // UIGraphicsBeginImageContextWithOptions (scale=0.0) for high res capture
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0.0)

        // renders the view's layer into the current graphics context
        if let context = UIGraphicsGetCurrentContext() { view.layer.render(in: context) }

        // creates UIImage from what was drawn into graphics context
        let screenshot: UIImage? = UIGraphicsGetImageFromCurrentImageContext()

        // clean up newly created context and return screenshot
        UIGraphicsEndImageContext()
        return screenshot
    }


}

