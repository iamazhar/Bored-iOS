//
//  APIService.swift
//  Bored
//
//  Created by Azhar Anwar on 06/09/18.
//  Copyright © 2018 Azhar Anwar. All rights reserved.
//

import Foundation


class APIService{
    //Shared instance Singleton
    static let shared = APIService()
    private let baseURL = "https://www.boredapi.com/api"
    private var activityEndpoint: String{
        get{
            return "\(baseURL)/activity"
        }
    }
    
    func performActivityRequest() -> RandomActivity?{
        do{
            let data = try Data(contentsOf: URL(string: self.activityEndpoint)!)
            return RandomActivity.parse(data: data)
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
}
