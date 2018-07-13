//
//  GaiaSession+Swift.swift
//  Blockstack
//
//  Created by AC sometime in May 2018.
//

import Foundation

public extension GaiaSession {
    func getRawFile(path: String, workaroundPath: String, completion: @escaping (Any?, GaiaError?) -> Void) {
        guard let config = self.config else {
            return
        }

        var fullReadURLString = "\(config.URLPrefix!)\(config.address!)/\(path)"
        if (workaroundPath != "") {
            fullReadURLString = "\(workaroundPath)/\(path)"
        }
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
    
    func putRawFile(path: String, stringContent: String, completion: @escaping (String?, GaiaError?) -> Void) {
        let contentType = "application/json"
        
        print(stringContent as Any)
        
        uploadToGaiaHub(path: path,
                        content: stringContent,
                        config: self.config!,
                        contentType: contentType,
                        completion: completion)
    }

    func resetAndClearConfig() {
        resetConfig()
        self.config = nil
    }
}

