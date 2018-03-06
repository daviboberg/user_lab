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
import Kingfisher

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
        let url = URL(string: "https://s3.invisionapp-cdn.com/storage.invisionapp.com/boards/files/63466810.png?x-amz-meta-iv=1&x-amz-meta-ck=a8e3a82a26df2cf32d8835e7abe302eb&AWSAccessKeyId=AKIAJFUMDU3L6GTLUDYA&Expires=1522540800&Signature=Ren9JkYRf1F0FfIN%2FyhRI5YEyUM%3D")
        profileImageView.kf.setImage(with: url)
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
