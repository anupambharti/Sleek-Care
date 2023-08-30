//
//  CodeVerification.swift
//  Sleek Care
//
//  Created by Anu on 30/08/23.
//

import UIKit

class CodeVerification: UIViewController {
    
    @IBOutlet weak var codeField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    

    @IBAction func pressed(_ sender: Any) {
        let text = codeField.text!
        AuthManager.shared.verifyCode(smsCode: text) { success in
            guard success else { return }
            DispatchQueue.main.async {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let resultViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
                self.navigationController?.pushViewController(resultViewController, animated: true)
                
            }
        }
    }

}
