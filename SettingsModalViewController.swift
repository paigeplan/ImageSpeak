//
//  SettingsModalViewController.swift
//  ImageSpeak
//
//  Created by Paige Plander on 6/20/15.
//  Copyright (c) 2015 Paige Plander. All rights reserved.
//

import UIKit

class SettingsModalViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var imagePicker: UIImageView!

    
    let picker = UIImagePickerController()
    
    
    @IBOutlet var textField: UITextField!
   
    
    
    @IBAction func shootPhoto(sender: UIButton) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    func returnImage() -> UIImage {
        return imagePicker.image!
    }
    
    func returnImageName() -> String {
        return textField.text
    }
    
    func noCamera(){
        let alertVC = UIAlertController(title: "Camera Feature Not Available", message: "This device does not have a camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func chooseFromLibrary(sender: UIButton) {
        // tells the picker to include all of the photo, not an edited portion
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        // creates a pop-over image-picker. (necessary for iPad)
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)//4
        // reference rectangle to view from (uses the bar button item)
        picker.popoverPresentationController?.sourceView = sender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
    }
    @IBAction func settingsDone(sender: UIButton) {

        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage: AnyObject? = info[UIImagePickerControllerOriginalImage]
        // shrinks image to a viewable size
        imagePicker.contentMode = .ScaleAspectFit
        imagePicker.image = (chosenImage as! UIImage)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Executes if the user wants to cancel (inside choose Photo)
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        
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
