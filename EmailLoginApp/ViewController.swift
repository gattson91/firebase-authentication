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
    /**
     * Tells if user is on sign in version or register version
     */
    var isOnSignIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
                        //TODO: Do some form validation on email and password
    
    /**
    Checks if they entered the correct username and password, takes them to home screen
    */
    @IBAction func signInPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passwordTextField.text
        { if isOnSignIn {
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    
                    if user != nil {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    } else {
                        //Error: check error and show message
                    }
                })
            }
            else {
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
        
                    if user != nil {
                        self.performSegue(withIdentifier: "GoToHome", sender: self)
                    } else {
                        //Error: check error and show message
                    }
                })
            }
        }
    }
    
    /* Toggle between sign in and register */
    @IBAction func signInSelectorChanged(_ sender:  UISegmentedControl) {
        
        //flip the boolean
        isOnSignIn = !isOnSignIn
        
        if isOnSignIn {
            signInLabel.text = "Sign In"
            signInButtonLabel.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButtonLabel.setTitle("Register", for: .normal)
        }
    }
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //removes keyboard once user is finished typing
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    
    }*/
}

