/*
LoginViewController.swift
Dorm-Seating

Created by Joshua D. Sanderson
Last modified April 27, 2016
Manages the view for logging in and creating new users.

*/

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    
    let client = BAAClient.sharedClient()
    
    // required initialisations for BaasBox
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidesWhenStopped = true
        errorLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginTapped(sender: UIButton) {
        // disables buttons when pressed
        loginButton.enabled = false
        signupButton.enabled = false
        spinner.startAnimating()
        
        client.authenticateUser(usernameField.text, password: passwordField.text, completion: { (success: Bool, error: NSError!) -> () in
            self.spinner.stopAnimating()
            self.loginButton.enabled = true
            self.signupButton.enabled = true
            if success {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.errorLabel.text = error.localizedDescription
            }
            
        })
    }

    @IBAction func signupTapped(sender: UIButton) {
        // disables buttons when pressed
        loginButton.enabled = false
        signupButton.enabled = false
        spinner.startAnimating()
        
        client.createUserWithUsername(usernameField.text, password: passwordField.text, completion: { (success: Bool, error: NSError!) -> () in
            self.spinner.stopAnimating()
            self.loginButton.enabled = true
            self.signupButton.enabled = true
            if success {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                self.errorLabel.text = error.localizedDescription
            }
            
        })
    }
}
