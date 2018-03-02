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

    @IBOutlet weak var userListTableView: UITableView!
    
    
    var userList: Observable<[String]>! = Observable.of(["Argentina", "Bolívia", "Brasil", "Chile", "Colômbia", "Equador", "Guiana", "Paraguai", "Peru", "Suriname", "Uruguai", "Venezuela"])
    
    let disposableBag = DisposeBag()

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
        
        
//        userListTableView
//            .rx
//            .items(cellIdentifier: "userCell", cellType: UserListTableViewCell.self){
//                row, element, cell in
//
//
//            }.disposed(by: disposableBag)
//
        
        userList.bind(to: userListTableView
            .rx
            .items(cellIdentifier: "userCell", cellType: UserListTableViewCell.self)){
                row,element,cell in
            
        }.disposed(by: disposableBag)
        
    }
}
