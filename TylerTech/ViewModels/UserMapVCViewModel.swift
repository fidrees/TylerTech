//
//  UserMapVCViewModel.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-28.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import Foundation
import MapKit

class UserMapVCViewModel {
    
    var userName = ""
    var userLatitude = 0.0
    var userLongitude = 0.0
    
    private var userDto: UserDto?
    
    init(_ userDto: UserDto) {
        self.userDto = userDto
        configureViewModel(userDto: userDto)
    }
    
    private func configureViewModel(userDto: UserDto) {
        userName += userDto.firstName
        userName += " " + userDto.lastName
        
        userLatitude = userDto.lastLocation.latitude
        userLongitude = userDto.lastLocation.longitude
    }
    
    func fetchUserPreviousCountriesLocation(completionHandler: @escaping ([String]) -> Void) {
        
        var userCountriesLocations: [String] = []
        
        guard let userDto = userDto else {
            return
        }
        let dispatchGroup = DispatchGroup()
        for userPreviousLocation in userDto.lastLocations {
            
            dispatchGroup.enter()
            let location = CLLocation(latitude: userPreviousLocation.latitude, longitude: userPreviousLocation.longitude)
            CLGeocoder().reverseGeocodeLocation(location) {placemarks, error in
                
                if let country = placemarks?.first?.country, error == nil {
                    userCountriesLocations.append(country)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completionHandler(Array(Set(userCountriesLocations)))
        }
    }
}
