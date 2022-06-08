//
//  VolunteerManagerTests.swift
//  VolunteerManagerTests
//
//  Created by Paul Inventado on 2/23/22.
//

import XCTest
@testable import VolunteerManager

class VolunteerManagerTests: XCTestCase {

    // Sample unit test
    func testAddValidNewVolunteer() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 5)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 5)
    }
    
    // TODO: Create your unit tests    

    func testAddNegativeHours() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: -5)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers.count, 0)
    }
    
    func testAddOverTwentyHours() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 30)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 20)
    }
    
    func testAddExistingValid() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 5)
        manager.volunteer("Paul", for: 10)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 15)
    }
    
    func testAddExistingOverTwenty() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 10)
        manager.volunteer("Paul", for: 20)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 20)
    }
    
    func testAddExistingNegative() {
        // Create Volunteer manager and add a volunteer with valid hours
        var manager = VolunteerManager()
        manager.volunteer("Paul", for: 10)
        manager.volunteer("Paul", for: -4)
        
        // Successfully adding a volunteer should change the volunteers dictionary.
        // Therefore we check whether we can find Paul with 5 hours assigned.
        XCTAssertEqual(manager.volunteers["Paul"], 10)
    }
}
