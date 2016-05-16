//
//  LifeCycleViewController.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController {

    @IBOutlet weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ACLog.sharedInstance.log("\(#function)")
        
        dispatch_async(dispatch_get_main_queue(), {
            self.logTextView.text = ACLog.sharedInstance.dump()
        })
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ACLog.sharedInstance.log("\(#function)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        ACLog.sharedInstance.log("\(#function)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        ACLog.sharedInstance.log("\(#function)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        ACLog.sharedInstance.log("\(#function)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        ACLog.sharedInstance.log("\(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ACLog.sharedInstance.log("\(#function)")
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

}
