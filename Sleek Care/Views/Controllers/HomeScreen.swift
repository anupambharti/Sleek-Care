//
//  HomeScreen.swift
//  Sleek Care
//
//  Created by Anu on 30/08/23.
//

import UIKit
import FirebaseFirestore

class HomeScreen: UIViewController {
    
    
    @IBOutlet weak var addNotesField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveNotes(_ sender: Any) {
        let note = addNotesField.text
        let db = Firestore.firestore()
        
        db.collection("Notes").document("Today").setData([
            "notes": note
        ])
    }

    @IBAction func QueryNotes(_ sender: Any) {
        FirestoreQuery()
    }
    
    func FirestoreQuery() {
        let db = Firestore.firestore()
        let docRef = db.collection("Notes").document("Today")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                
                    self.notesField.text = document.get("notes") as! String
                
                
            }
            
            else
            {
                print("Document does not exist")
            }
        }
    }// Query end
}
