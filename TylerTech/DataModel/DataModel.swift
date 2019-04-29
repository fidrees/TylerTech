//
//  DataModel.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import Foundation

struct LocationDto {
    var latitude: Double
    var longitude: Double
}

struct UserDto {
    var firstName: String
    var lastName: String
    var lastLocation: LocationDto
    var lastLocations: [LocationDto]
}
