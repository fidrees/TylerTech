//
//  UserListVCViewModel.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import Foundation

class UserListVCViewModel {
    
    var updateUIClosure: ()->() = {}
    
    private var serviceApi: ServiceApi
    private var users:[UserDto] = []
    
    init(serviceApi: ServiceApi) {
        self.serviceApi = serviceApi
    }
    
    func fetchUsers() {
        serviceApi.fetchUsers(successHandler: {[weak self] (users) in
            guard let self = self else {
                return
            }
            self.users.append(contentsOf: self.sortUsersByName(users))
            self.updateUIClosure()
        }) { (errorString) in
            print(errorString)
        }
    }

    private func sortUsersByName(_ users: [UserDto]) -> [UserDto] {
        return users.sorted(by: { $0.firstName < $1.firstName })
    }
    
    func numberOfRowsInSection() -> Int {
        return users.count
    }
    
    func cellViewModelAtIndexPath(indexPath: IndexPath) -> UserListCellViewModel {
        let user : UserDto = users[indexPath.row]
        let cellViewModel = UserListCellViewModel(user)
        
        return cellViewModel
    }
    
    func userMapViewModelAtIndexPath(indexPath: IndexPath) -> UserMapVCViewModel {
        let user : UserDto = users[indexPath.row]
        let userMapViewModel = UserMapVCViewModel(user)
        
        return userMapViewModel
    }
}
