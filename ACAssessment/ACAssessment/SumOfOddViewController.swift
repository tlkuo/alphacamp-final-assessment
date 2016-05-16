//
//  SumOfOddViewController.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import UIKit

class SumOfOddViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    private var start: Int = 1
    private var end: Int = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        self.outputLabel.text = "\(calSumOfOdd(from: start, to: end))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Custom Method
    private func calSumOfOdd(from start: Int, to end: Int) -> Int {

        return 0
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
