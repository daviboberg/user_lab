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
import Moya
import Kingfisher

class UserListViewController: UIViewController {

    @IBOutlet weak var userListTableView: UITableView!
    
    
    var userList:[User] = [User]()
    
    var userListObservable: Variable<[User]> = Variable([])
    
    let disposableBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpBinding()
        getAllUser()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profile"{
            guard let user = sender as? User else {
                return
            }

            let evaluationProfileController = segue.destination as? EvaluationProfileViewController
            evaluationProfileController?.user = Variable(user)
        }
  
    }
    
    func getAllUser(){
        
        let provider = MoyaProvider<UsersCollectRouter>(plugins: [NetworkLoggerPlugin()])
        
        let userCollectService = UsersCollectServiceImpl(provider: provider)
        
        guard let token = UserSingleton.instance.tokenManager?.accessToken else {
            //TODO: Colocar um aviso pro usuario caso nao funcione
            return
        }
        let response = userCollectService.getUsersCollect(token: token)
        
        response.mapJSON()
            .asObservable()
            .map({ result in
                guard let resultDictionary = result as? Dictionary<String,Any> else {
                    return []
                }
                
                guard let users = resultDictionary["users"] as? Array<Dictionary<String,Any>> else{
                    return []
                }
    
                return users.flatMap { User(dictionary: $0) }
            })
            .debug("response")
            .bind(to: userListObservable)
            .disposed(by: disposableBag)
    }

}


extension UserListViewController:UITableViewDelegate{
    
    func setUpBinding(){
        bindTableView()
        bindTableViewSelectedCell()
    }
    
    func bindTableView(){
        userListObservable.asObservable().bind(to: userListTableView
            .rx
            .items(cellIdentifier: "userCell", cellType: UserListTableViewCell.self)){
                row,element,cell in
                
                
                cell.usernameLabel.text = element.first_name! + " " + element.last_name!
                cell.userTeamLabel.text = element.team
                cell.userImageView.kf.setImage(with: URL(string: element.pictureUrl!))

            }.disposed(by: disposableBag)
    }
    
    func bindTableViewSelectedCell(){
        
        userListTableView
            .rx
            .itemSelected
            .subscribe{result in
                guard let event = result.element else {
                    return
                }
                
                let userArray = self.userListObservable.value
                let user = userArray[event.row]
                self.performSegue(withIdentifier: "profile", sender: user)
                
            }.disposed(by: disposableBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

