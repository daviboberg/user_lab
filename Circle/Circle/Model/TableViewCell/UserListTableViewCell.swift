//
//  UserListTableViewCell.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    //MARK: OUTLETS
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userTeamLabel: UILabel!
    
    
    
    //MARK: CELL METHODS
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
