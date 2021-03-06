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

        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Custom Method
    
    func saveData() {

        let dataPath = NSHomeDirectory().stringByAppendingString("/Documents/imageData")
        let nsImageArray = NSMutableArray()

        for data in imageData {
            let nsImageDic = NSMutableDictionary()

            nsImageDic["image"] = UIImageJPEGRepresentation(data.image, 1.0)
            nsImageDic["text"] = data.text

            nsImageArray.addObject(nsImageDic)
        }

        nsImageArray.writeToFile(dataPath, atomically: true)
    }
    
    func loadData() {

        let dataPath = NSHomeDirectory().stringByAppendingString("/Documents/imageData")
        
        if let nsImageArray = NSArray(contentsOfFile: dataPath) {

            self.imageData.removeAll()
            
            for data in nsImageArray {
                if let nsDic = data as? NSDictionary,
                    nsImageData = nsDic["image"] as? NSData,
                    nsText = nsDic["text"] as? String {

                    self.imageData.append(ImageData(image: UIImage(data: nsImageData)!, text: nsText))
                }
            }
        }
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

        if let controller = segue.destinationViewController as? ImageShareViewController,
            indexPath = imageTableView.indexPathForSelectedRow {

            controller.shareImage = imageData[indexPath.row].image
            controller.shareText = imageData[indexPath.row].text

            imageTableView.deselectRowAtIndexPath(indexPath, animated: false)
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
        saveData()
    }
}
