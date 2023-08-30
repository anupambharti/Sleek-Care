//
//  ViewController.swift
//  Sleek Care
//
//  Created by Anu on 29/08/23.
//

import UIKit

class PhoneAuthentication: UIViewController {
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func pressed(_ sender: Any) {
        let text = phoneNumberField.text!
        let number = "+91\(text)"
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
            guard success else { return }
            DispatchQueue.main.async {
                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let resultViewController = storyBoard.instantiateViewController(withIdentifier: "CodeVerification") as! CodeVerification
                    self?.navigationController?.pushViewController(resultViewController, animated: true)
                }
            }
        }
    }
  
    
}
