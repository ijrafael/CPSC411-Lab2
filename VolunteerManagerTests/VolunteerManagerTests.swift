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
    
    // TODO: Create your unit tests below
    
    //adds a person with 0 hours, should not add it to the list
    func testAddVolunteerUnder0() {
        var manager = VolunteerManager()
        manager.volunteer("Tim", for: -1)
        //nil means no volunteer was added
        XCTAssertEqual(manager.volunteers["Tim"], nil)
    }
    
    //adds a volunteer twice, with two different values. Since the person already exists, add it to existing hours.
    func testAddVolunteerTwice() {
        var manager = VolunteerManager()
        //creates volunteer named "Steven" with 3 hours
        manager.volunteer("Steven", for: 3)
        //adds 5 hours to "Steven"
        manager.volunteer("Steven", for: 5)
        //total hours should be 8
        XCTAssertEqual(manager.volunteers["Steven"], 8)
    }
    
    //adds a volunteer with more than 20 hours, should set it to 20.
    func testAddVolunteerOver20() {
        var manager = VolunteerManager()
        manager.volunteer("Jess", for: 23)
        //sets hours to 20 since 23 > 20, 20 is the max hours
        XCTAssertEqual(manager.volunteers["Jess"], 20)
    }
    
    
    
    //adds a volunteer twice, however the sum is over 20, should decrease hours to 20
    func testAddVolunteerTwiceOver20() {
        var manager = VolunteerManager()
        //creates volunteer "Mai" with 10 hours
        manager.volunteer("Mai", for: 10)
        //adds 15 hours to "Mai"
        manager.volunteer("Mai", for: 15)
        //limits total hours to 20, so Mai should have 20 hours
        XCTAssertEqual(manager.volunteers["Mai"], 20)
    }
    
    //adds a volunteer and tries to subtract hours
    func testAddVolunteerWithNegativeHours() {
        var manager = VolunteerManager()
        //creates volunteer "Ash" With 10 hours
        manager.volunteer("Ash", for: 10)
        //tries to subtract 5 hours from "Ash"
        manager.volunteer("Ash", for: -5)
        //it should ignore the -5 and keep the hours the same at 10
        XCTAssertEqual(manager.volunteers["Ash"], 10)
    }
}
