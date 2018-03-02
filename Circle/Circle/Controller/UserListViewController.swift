//
//  UserListViewController.swift
//  Circle
//
//  Created by Giulia Cesar Padovani on 01/03/2018.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var teamUILabel: UILabel!
    @IBOutlet weak var tableCell: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension UserListViewController{
    
    
    func setUpBinding(){
        
    }
}
