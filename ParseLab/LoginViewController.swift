//
//  LoginViewController.swift
//  ParseLab
//
//  Created by Aristotle on 2017-02-28.
//  Copyright © 2017 HLPostman. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: AnyObject) {
        PFUser.logInWithUsername(inBackground: emailField.text!, password: passwordField.text!) {
            (user: PFUser?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.goToChatroom()
                print("User logged in successfully")
            }
            
        }
    }

    @IBAction func onSignupButton(_ sender: AnyObject) {
        let newUser = PFUser()
        
        // set user properties
        newUser.username = emailField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (succeeded: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.goToChatroom()
                print("User registered successfully")
                // manually segue to logged in view
            }
        }
 
    }
    
    func goToChatroom() {
        self.performSegue(withIdentifier: "login_or_signup_segue_to_chatroom", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
