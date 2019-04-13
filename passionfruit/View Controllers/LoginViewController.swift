//
//  ViewController.swift
//  passionfruit
//
//  Created by Rishab Chawla on 2/19/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet var signInButton: GIDSignInButton!
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Tapped signin button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signOut()
        signInButton.style = .wide

    }
}

extension LoginViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Signing in...")
        if let error = error {
            print("Sign in error")
            return
        }
        

        while (!user.profile.email.contains("rutgers.edu")) {
            if let error = error {
                print("Sign in error")
                return
            }
        }
        guard let authentication = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
    
        
        
        Auth.auth().signInAndRetrieveData(with: credentials) { (authResult, error) in
            if let error = error {
                print("Sign in error")
                return
            }
            print("Signed in user " + user.profile.name)
            print("Signed in user email " + user.profile.email)
            if (user.profile.email.contains("rutgers.edu")) {
                if ((authResult?.additionalUserInfo!.isNewUser)!) {
                    self.performSegue(withIdentifier: "showSignUp", sender: self)
                } else {
                    self.performSegue(withIdentifier: "showFeed", sender: self)
                }
            } else {
                return
            }
        }
    }
    
}

