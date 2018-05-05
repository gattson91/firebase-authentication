//
//  ViewController.swift
//  EmailLoginApp
//
//  Created by Gabrielle Anderson on 2018-05-02.
//  Copyright © 2018 Gabrielle Anderson. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isOnSignIn: Bool = true
    //Segment 0 is "sign in", segment 1 is "register"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
    
    //TO DO: Do some form validation on email and password
    
    if let email = emailTextField.text, let pass = passwordTextField
        {
            
            //Check if it's sign in or register
            if isOnSignIn {
                //Sign in the user with Firebase
                Auth.auth().signIn(withEmail: "", password: "", completion: { (user, error) in
                    
                    //Check that user isn't nil
                    if let u = user {
                        //User is found, go to home screen
                    } else {
                        //Error: check error and show message
                    }
                })
                
            }
            else {
                //Register the user with Firebase
                
                Auth.auth().createUser(withEmail: "", password: "", completion: { (user, error) in
                    
                    //Check that user isn't nil
                    if let u = user {
                        //user is found, go to home screen
                    } else {
                        //Error: check error and show message
                    }
                })
            }
        }
    }
    



    
    @IBAction func signInSelectorChanged(_ sender: /* Toggle between sign in and register*/ UISegmentedControl) {
        
        
        //flip the boolean
        isOnSignIn = !isOnSignIn
        
        //check the bool and set the button and labels
        if isOnSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
        
    
       
}

}
