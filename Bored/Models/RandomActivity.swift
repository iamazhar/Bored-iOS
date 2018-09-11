//
//  RandomActivity.swift
//  Bored
//
//  Created by Azhar Anwar on 06/09/18.
//  Copyright © 2018 Azhar Anwar. All rights reserved.
//

import Foundation

struct RandomActivity: Codable{
    var activity: String!
    var type: String!
    var participants: Int!
    
    enum CodingKeys: String, CodingKey{
        case activity, type, participants
    }

    static func parse(data: Data) -> RandomActivity? {
        let decoder = JSONDecoder()
        do {
            let activity = try decoder.decode(RandomActivity.self, from: data)
            return activity
        }
        catch let error as NSError {
            print("Error \(error.localizedDescription)")
            return nil
        }
    }
}
