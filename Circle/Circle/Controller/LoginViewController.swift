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
    
    let disposableBag = DisposeBag()
    
    
    //MARK: VIEW CONTROLLER METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: CUSTOM METHODS
    func bind(){
        
        confirmButton.rx.tap.bind{
            let provider = MoyaProvider<AuthRouter>(plugins: [NetworkLoggerPlugin()])

            let authService = AuthServiceImpl(provider: provider)

            let response = authService.authenticate(user: self.userTextField.text!, password: self.passwordTextField.text!)
            response.mapJSON()
                .subscribe(onSuccess: { (result) in
                print(response)
                    //
                
                    guard let resultDictionary = result as? Dictionary<String,AnyObject> else {
                        return
                    }
                    
                    let token = resultDictionary["access_token"] as! String
            
                    UserSingleton.instance.tokenManager  = TokenManager(dictionary: resultDictionary)
    
                    self.getUserWith(token: token)
       
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                
                }, onError: { (error) in
                    print(error)
                }).disposed(by: self.disposableBag)
        }.disposed(by: disposableBag)
    }

    
    
    
    func getUserWith(token:String){
        
        let provider = MoyaProvider<UserRouter>(plugins: [NetworkLoggerPlugin()])
        
        let userService = UserServiceImpl(provider: provider)
        
        let response = userService.getUser(token: token, id: "me")
        
        response.mapJSON()
            .subscribe(onSuccess: { (result) in
                
                print(result)
                
            }) { (error) in
                
                print(error)
            }.disposed(by: disposableBag)
    
    }
    
    
    
    func getCompanyWith(token:String){
        
        let provider =  MoyaProvider<CompanyRouter>(plugins: [NetworkLoggerPlugin()])
        
        let companyService = CompanyServiceImpl(provider: provider)
        
        companyService.getCompanyWith(token: token)
            .mapJSON()
            .subscribe(onSuccess: { (response) in
                
            }) { (error) in
                
        }.disposed(by: disposableBag)
    }
    

}

