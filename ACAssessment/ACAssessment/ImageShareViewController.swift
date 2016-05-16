//
//  ImageShareViewController.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import UIKit
import Social

class ImageShareViewController: UIViewController {

    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareTextLabel: UILabel!
    
    var shareImage: UIImage?
    var shareText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let shareImage = self.shareImage {
            shareImageView.image = shareImage
        }

        if let shareText = self.shareText {
            shareTextLabel.text = shareText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    
    @IBAction func share(sender: AnyObject) {
        
        if let image = self.shareImage {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            controller.addImage(image)
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
}

extension ImageShareViewController: UIScrollViewDelegate {

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return shareImageView
    }
}
