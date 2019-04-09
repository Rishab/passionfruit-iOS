//
//  PopupViewController.swift
//  passionfruit
//
//  Created by Rishab Chawla on 4/8/19.
//  Copyright © 2019 Rishab Chawla. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet var popupView: UIView!
    
    @IBOutlet var popupNameLabel: UILabel!
    
    @IBOutlet var popupProfilePicture: UIImageView!
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        print("View Did Load")
        
        super.viewDidLoad()
        setupPopup()
        // Do any additional setup after loading the view.
        
    }
    
    func setupPopup() {
        popupNameLabel.text = user?.name
        popupView.layer.cornerRadius = 15.0
        popupView.layer.masksToBounds = true
        popupProfilePicture.layer.cornerRadius = 50
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

extension PopupViewController: UserDelegate {
    func didTapUserCell(user: User) {
        print("Name:")
        popupNameLabel.text = user.name
    }
}
