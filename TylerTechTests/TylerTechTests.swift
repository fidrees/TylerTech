//
//  TylerTechTests.swift
//  TylerTechTests
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import XCTest
@testable import TylerTech

class TylerTechTests: XCTestCase {
    
    var userListVCViewModel = UserListVCViewModel(serviceApi: ServiceApi.sharedInstance)
    var userListCellViewModel = UserListCellViewModel(UserDto(firstName: "Fahad", lastName: "Idrees", lastLocation: LocationDto(latitude: 100.0, longitude: 100.0), lastLocations: [LocationDto(latitude: 200.0, longitude: 200.0)]))
    var userMapVCViewModel = UserMapVCViewModel(UserDto(firstName: "Fahad", lastName: "Idrees", lastLocation: LocationDto(latitude: 100.0, longitude: 100.0), lastLocations: [LocationDto(latitude: 200.0, longitude: 200.0)]))

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserListVCViewModel() {
        userListVCViewModel.fetchUsers()
        XCTAssertNotNil(userListVCViewModel.numberOfRowsInSection())
    }
    
    func testUserListCellViewModel() {
        XCTAssertNotNil(userListCellViewModel.userName)
    }
    
    func testUserMapVCViewModel() {
        XCTAssertNotNil(userMapVCViewModel.userName)
        XCTAssertNotNil(userMapVCViewModel.userLatitude)
        XCTAssertNotNil(userMapVCViewModel.userLongitude)
    }
}
