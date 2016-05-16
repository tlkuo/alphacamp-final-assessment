//
//  ImageCaptureViewController.swift
//  ACAssessment
//
//  Created by martin on 2016/5/16.
//  Copyright © 2016年 Frainbow. All rights reserved.
//

import UIKit
import AVFoundation

protocol ImageCaptureDelegate: class {
    func capturedImage(image: UIImage, text: String)
}

class ImageCaptureViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var imageTextField: UITextField!

    weak var delegate: ImageCaptureDelegate?
    var defaultText: String = "data"

    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCaptureStillImageOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageTextField.text = defaultText

        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto

        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            captureSession = nil
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            captureSession = nil
            return
        }

        stillImageOutput = AVCaptureStillImageOutput()
        stillImageOutput.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]

        if captureSession.canAddOutput(stillImageOutput) {
            captureSession.addOutput(stillImageOutput)
        } else {
            captureSession = nil
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraView.layer.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        cameraView.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.running == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.running == true) {
            captureSession.stopRunning();
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
    
    // MARK: - Action

    @IBAction func takePhoto(sender: AnyObject) {
        
        if let videoConnection = stillImageOutput.connectionWithMediaType(AVMediaTypeVideo) {
            stillImageOutput.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { buffer, error in
                
                let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer)
                let dataProvider = CGDataProviderCreateWithCFData(imageData)
                let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, .RenderingIntentDefault)
                let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)

                self.delegate?.capturedImage(image, text: self.imageTextField.text ?? "")
                self.navigationController?.popViewControllerAnimated(true)
            })
        }
    }
}
