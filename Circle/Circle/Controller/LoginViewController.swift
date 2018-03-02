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
                .subscribe(onSuccess: { (response) in
                print(response)
                }, onError: { (error) in
                    print(error)
                }).disposed(by: self.disposableBag)
        }.disposed(by: disposableBag)
    }

    func getCompanyWith(token:String){
        
        let provider =  MoyaProvider<CompanyRouter>()
        
        let companyService = CompanyServiceImpl(provider: provider)
        
        companyService.getCompanyWith(token: token)
            .mapJSON()
            .subscribe(onSuccess: { (response) in
                
            }) { (error) in
                
        }.disposed(by: disposableBag)
    }
    

}

