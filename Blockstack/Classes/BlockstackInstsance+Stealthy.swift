//
//  BlockstackInstance+Swift.swift
//  Blockstack
//
//  Created by AC sometime in May 2018.
//

import Foundation

public extension BlockstackInstance {

    // This method conforms to the original Blockstack Javascript API behavior, returning a
    // string or buffer and not trying to convert it to JSON.
    //
    @objc public func getRawFile(path: String, completion: @escaping (Any?, Error?) -> Void) {
        let translatedCompletion: (Any?, GaiaError?) -> Void = { value, error in
            completion(value, error)
        }

        Gaia.sharedSession().getOrSetLocalHubConnection { error in
            guard error == nil else {
                print("gaia connection error")
                completion(nil, error)
                return
            }

            Gaia.sharedSession().getRawFile(path: path, completion: translatedCompletion)
        }
    }


    @objc public func putRawFile(path: String, stringContent: String, completion: @escaping (Any?, Error?) -> Void) {
        let translatedCompletion: (Any?, GaiaError?) -> Void = { value, error in
            completion(value, error)
        }

        Gaia.sharedSession().getOrSetLocalHubConnection { error in
            guard error == nil else {
                print("gaia connection error")
                completion(nil, error)
                return
            }

            Gaia.sharedSession().putRawFile(path: path, stringContent: stringContent, completion: translatedCompletion)
        }
    }

    // Stealthy uses this to get an app public key from the app private key. (This appears to
    // be different than the public key returned in the user profile.
    //
    @objc public func getPublicKeyFromPrivate(aPrivateKey: String) -> String? {
        let publicKey = Keys.getPublicKeyFromPrivate(aPrivateKey);
        return publicKey;
    }
}
