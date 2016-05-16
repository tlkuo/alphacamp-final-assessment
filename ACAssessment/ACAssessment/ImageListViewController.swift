//
//  ImageListViewController.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import UIKit

class ImageData {
    var image: UIImage
    var text: String
    
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
    }
}

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var imageTableView: UITableView!
    
    var imageData: [ImageData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let controller = segue.destinationViewController as? ImageCaptureViewController {
            controller.delegate = self
            controller.defaultText = "data \(imageData.count + 1)"
        }
    }
}

extension ImageListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageItem", forIndexPath: indexPath)

        cell.imageView?.image = imageData[indexPath.row].image
        cell.textLabel?.text = imageData[indexPath.row].text

        return cell
    }
}

extension ImageListViewController: ImageCaptureDelegate {

    func capturedImage(image: UIImage, text: String) {
        imageData.append(ImageData(image: image, text: text))
        imageTableView.reloadData()
    }
}
