//
//  Encryption.swift
//  Blockstack
//
//  Created by Yukan Liao on 2018-04-15.
//

import Foundation

@objc open class Encryption : NSObject {
    
    @objc static open func decryptPrivateKey(privateKey: String, hexedEncrypted: String) -> String? {
        let encryptedData = Data(fromHexEncodedString: hexedEncrypted)
        let cipherObjectJSONString = String(data: encryptedData!, encoding: .utf8)
        let encryptionJS = EncryptionJS()
        return encryptionJS.decryptECIES(privateKey: privateKey, cipherObjectJSONString: cipherObjectJSONString!)
    }

    @objc static open func encryptPrivateKey(publicKey: String, privateKey: String) -> String? {
        let encryptionJS = EncryptionJS()
        return encryptionJS.encryptECIES(publicKey: publicKey, content:privateKey)
    }


    // Experiment calling encryptContent / decryptContent:
    //
    @objc static open func encryptContent(content: String) -> String? {
        let encryptionJS = EncryptionJS()
        return encryptionJS.encryptContent(content:content)
    }

    @objc static open func decryptContent(content: String) -> String? {
//        let encryptedData = Data(fromHexEncodedString: hexedEncrypted)
//        let cipherObjectJSONString = String(data: encryptedData!, encoding: .utf8)

//        let encryptionJS = EncryptionJS()
//        return encryptionJS.decryptECIES(privateKey: privateKey, cipherObjectJSONString: cipherObjectJSONString!)

        let encryptionJS = EncryptionJS()
        return encryptionJS.decryptECIES(content: content)
    }
}
