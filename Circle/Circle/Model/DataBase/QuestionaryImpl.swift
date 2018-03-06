//
//  DataBaseImpl.swift
//  Circle
//
//  Created by Davi Boberg on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class QuestionaryImpl : Questionary {
    
    var ref = Database.database().reference()
    func connect() {
        FirebaseApp.configure()
    }
    
    func loadQuestionary() {
        
        ref.child("Questions").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let question = value?["key"] as? String ?? ""

            let jsonData = question.data(using: String.Encoding.utf8)
            let json = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableLeaves)
            let dictQuestions = json as! [String:AnyObject]
            for (key, value) in dictQuestions {
                print(key)
                print(value)
            }
            }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func saveAnswers(){
        ref = Database.database().reference()
        // Exemple of saving to database
        self.ref.child("Answers").setValue(["key":"[1, 2]]"])
    }
}
