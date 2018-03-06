//
//  LocalUserViewController.swift
//  Circle
//
//  Created by Gabriel Branco Frizzo on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EvaluationProfileViewController: UIViewController {
    
    @IBOutlet weak var evaluateButton: UIButton!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var user:Variable<User> = Variable(User())
    
    var disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://s3.invisionapp-cdn.com/storage.invisionapp.com/boards/files/63466810.png?x-amz-meta-iv=1&x-amz-meta-ck=a8e3a82a26df2cf32d8835e7abe302eb&AWSAccessKeyId=AKIAJFUMDU3L6GTLUDYA&Expires=1522540800&Signature=Ren9JkYRf1F0FfIN%2FyhRI5YEyUM%3D")
        profileImageView.kf.setImage(with: url)
        setUpBind()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToForm(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Form")
        self.present(controller, animated: true) {}
    }
}

extension EvaluationProfileViewController {
    
    func setUpBind(){
        user.asObservable().subscribe(onNext: { user in
            guard let email = user.email else {return}
            guard let name = user.first_name else {return}
            guard let lastName = user.last_name else {return}
            guard let pictureUrl = user.pictureUrl else {return}
            guard let jobTitle = user.job_title else {return}
            
            self.emailLabel.text = email
            self.profileNameLabel.text = name + " " + lastName
            self.positionLabel.text = jobTitle
            self.profileImageView.kf.setImage(with: URL(string: pictureUrl))
            
        }).disposed(by: disposableBag)

        evaluateButton.rx.tap.bind{
            self.goToForm()
        }.disposed(by: disposableBag)
    }
}
