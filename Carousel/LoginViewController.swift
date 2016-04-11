//
//  LoginViewController.swift
//  Carousel
//
//  Created by Bryant, Jason on 4/9/16.
//  Copyright © 2016 Bryant, Jason. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        print("KEYBOARD WILL SHOW")
        
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("KEYBOARD WILL HIDE")
    }
    
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
            // scrollView.delegate = self
            // Never set Delegate correctly? 6:20pm 4.9.16
        
            class LoginViewController: UIViewController, UIScrollViewDelegate {
            }
        
            scrollView.contentSize = scrollView.frame.size
            scrollView.contentInset.bottom = 100
        
            initialY = fieldParentView.frame.origin.y
            print("INITIAL Y")
            offset = 10
        
            // Button Jumping
            buttonInitialY = buttonParentView.frame.origin.y
            buttonOffset = -90
    
        
        
        func viewDidLoad() {
            super.viewDidLoad()
    

            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    @IBAction func didPressLogin(sender: AnyObject) {
        // Start animating the activity indicator
        loginIndicator.startAnimating()
        // Set the Button state to "Selected"
        loginButton.selected = true
        // If both the email and password fields match what we are looking for...
        if emailField.text == "e" && passwordField.text == "p" {
            // Delay for 2 second.
            delay(1, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next screen.
                print("ON TO NEXT PAGE")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        } else {
            
            // If both the email and password fields are empty...
            if emailField.text!.isEmpty {
                // Delay for 2 second.
                delay(1, closure: { () -> () in
                    // Stop animating the activity indicator.
                    self.loginIndicator.stopAnimating()
                    // Set the button state back to default, "Not Selected".
                    self.loginButton.selected = false
                    // Create and Show UIAlertController...see guide, Using UIAlertController
                    let alertController = UIAlertController(title: "Valid Email Needed", message: "YOU SHALL NOT PASS!", preferredStyle: .Alert)
                    self.presentViewController(alertController, animated: true) {}
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                })
                // Otherwise, email or password are incorrect so...
            } else {
                // Delay for 2 second
                delay(1, closure: { () -> () in
                    // Stop animating the activity indicator.
                    print("ALERT")
                    self.loginIndicator.stopAnimating()
                    // Set the button state back to default, "Not Selected".
                    self.loginButton.selected = false
                    // Create and Show UIAlertController...see guide, Using UIAlertController
                    let alertController = UIAlertController(title: "Valid Email and Password Needed", message: "YOU SHALL NOT PASS!", preferredStyle: .Alert)
                    self.presentViewController(alertController, animated: true) {}
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                })
            }
     
        }
        
        
    }

    @IBAction func back(sender: UIButton) {
        navigationController?.popToRootViewControllerAnimated(true)
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
