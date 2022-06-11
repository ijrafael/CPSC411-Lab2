//
//  VolunteerManager.swift
//  VolunteerManager
//
//  Created by Paul Inventado on 2/23/22.
//

import Foundation

// TODO: Fix the code based on the results of the unit test

struct VolunteerManager {
    /// private(set) indicates the variable can only be changed within the class
    private(set) var volunteers: [String:Int] = [:]
    
    mutating func volunteer(_ name: String, for hours: Int) {
        
        //checks to make sure the hours added is more than 0, fixed bug
        if hours > 0 {
        
            if let volunteerHours = volunteers[name] {
                //added hours, if the volunteer exists, fixed bug
                volunteers[name] = volunteerHours + hours
            } else {
                //if volunteer doesn't already exist just add hours
                volunteers[name] = hours
            }
            
            //changed the value from 30 to 20, fixed bug
            if let volunteerHours = volunteers[name], volunteerHours > 20 {
                volunteers[name] = 20
            }
        }
    }
        
}
