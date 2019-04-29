//
//  UserCell.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    
    var cellViewModel:UserListCellViewModel? {
        didSet {
            if let cellViewModel = cellViewModel {
                configureCell(cellViewModel: cellViewModel)
            }
        }
    }
    
    private func configureCell(cellViewModel: UserListCellViewModel) {
        userName.text = cellViewModel.userName
    }
}
