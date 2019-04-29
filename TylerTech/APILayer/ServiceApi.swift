//
//  ServiceApi.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import Foundation
import main

class ServiceApi {
    
    static let sharedInstance = ServiceApi()
    
    func fetchUsers(successHandler: @escaping ([UserDto]) -> Void, errorHandler: @escaping (String) -> Void) {
        
        let userApi = UserApi()
        let usersData = userApi.getUsers()
        
        let users = parseUserData(usersData: usersData)
        
        if users.count == 0 {
            errorHandler("Not able to fetch data")
        } else {
            successHandler(users)
        }
    }
    
    private func parseUserData(usersData: [User]) ->[UserDto] {
        var finalArray : [UserDto] = []
        
        for user in usersData {
            let userlocation = LocationDto.init(latitude: user.lastLocation.latitude, longitude: user.lastLocation.longitude)
            let userLastLocations = user.lastLocations.map({
                LocationDto(latitude: $0.latitude, longitude: $0.longitude)
            })
            
            let userDto = UserDto.init(firstName: user.firstName, lastName: user.lastName, lastLocation: userlocation, lastLocations: userLastLocations)
            finalArray.append(userDto)
        }
        
        return finalArray
    }
}
