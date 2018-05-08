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

    @IBOutlet weak var signInButtonLabel: UIButton!
    
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
    
    /**
    * Checks if they entered the correct username and password, takes them to home screen
    */
    
     //TODO: Do some form validation on email and password
    
    
    
    @IBAction func signInPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            
            //Check if it's sign in or register
            if isOnSignIn {
                //Sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    //Check that user isn't nil
                    if user != nil {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    } else {
                        //Error: check error and show message
                    }
                })
                
            }
            else {
                //Register the user with Firebase
                
                Auth.auth().createUser(withEmail: "", password: "", completion: { (user, error) in
                    
                    //Check that user isn't nil
                    if user != nil {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
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
            signInButtonLabel.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButtonLabel.setTitle("Register", for: .normal)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //removes keyboard once user is finished typing
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
}

