//
//  LoginViewController.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 28/02/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

import Alamofire
class LoginViewController: UIViewController {

    //MARK: OUTLETS
    
    
    
    @IBOutlet weak var logoLabel: UILabel!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        // Do any additional setup after loading the view.
    
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bind(){
        
         let authService = AuthService()
        let response = authService.authenticate(user: self.userTextField.text!, password: self.passwordTextField.text!)
       
        confirmButton.rx.tap.bind{
  
            authService.authenticate(user: self.userTextField.text!, password: self.passwordTextField.text!, completion: { (data) in
                
                print(data)
                print("narutinho deu boa <3")
            })
        }
    }
    
    func callPingboardAPI(user:String?,password:String?){
        
        guard let username = user else{return}
        
        guard let password = password else {return}
        

        let url = URL(string: "https://app.pingboard.com/oauth/token?grant_type=password")!
        
        request(url, method: .post, parameters: ["username":username,"password":password], encoding: URLEncoding.httpBody, headers: ["Content-Type":"application/x-www-form-urlencoded"]).responseJSON { (data) in
            print(data)
            
            guard let statusCode = data.response?.statusCode else {
                return
            }
            print("Codigo de Status: \(statusCode)")
            print(data.result.value)
            
            let resultDictionary = data.result.value as! [String:Any]
            
            let resultToken = resultDictionary["access_token"] as! String
            print(resultToken)
           // self.token = resultToken
            
        }
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






extension String{
    
}
extension LoginViewController
{
   
    
}

enum Color {
    
    case blue
    case black
    case white
    
    
}
