//
//  UserProfileViewController.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserProfileViewController: UIViewController {

    
    //MARK: OUTLETS
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    let disposableBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension UserProfileViewController{
    
    
    func setUpBindings(){
        
        setUpButton()
        
        
       
    }
    
    
    func setUpLabels(){
        
    }
    func setUpButton(){
        logoutButton.rx.tap.bind{
            
            }.disposed(by: disposableBag)
    }
}
