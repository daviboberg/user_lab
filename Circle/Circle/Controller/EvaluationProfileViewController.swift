//
//  LocalUserViewController.swift
//  Circle
//
//  Created by Gabriel Branco Frizzo on 05/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit

class LocalUserViewController: UIViewController {
    
    @IBOutlet weak var evaluateButton: UIButton!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://s3.invisionapp-cdn.com/storage.invisionapp.com/boards/files/63466810.png?x-amz-meta-iv=1&x-amz-meta-ck=a8e3a82a26df2cf32d8835e7abe302eb&AWSAccessKeyId=AKIAJFUMDU3L6GTLUDYA&Expires=1522540800&Signature=Ren9JkYRf1F0FfIN%2FyhRI5YEyUM%3D")
        profileImageView.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
