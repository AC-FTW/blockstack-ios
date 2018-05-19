//
//  GaiaSession+Swift.swift
//  Blockstack
//
//  Created by AC sometime in May 2018.
//

import Foundation

public extension GaiaSession {
    func getRawFile(path: String, completion: @escaping (Any?, GaiaError?) -> Void) {
        guard let config = self.config else {
            return
        }
        
        let fullReadURLString = "\(config.URLPrefix!)\(config.address!)/\(path)"
        let fullReadURL = URL(string: fullReadURLString)
        
        let task = URLSession.shared.dataTask(with: fullReadURL!) { data, response, error in
            guard let data = data, error == nil else {
                print("Gaia hub store request error")
                completion(nil, GaiaError.requestError)
                return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
}

