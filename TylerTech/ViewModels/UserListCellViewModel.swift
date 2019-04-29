//
//  UserListCellViewModel.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import Foundation
import MapKit

class UserListCellViewModel {
    
    var userName = ""
    
    init(_ userDto: UserDto) {
        configureCellViewModel(userDto: userDto)
    }
    
    private func configureCellViewModel(userDto: UserDto) {
        userName += userDto.firstName
        userName += " " + userDto.lastName
    }
}
