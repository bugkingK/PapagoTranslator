//
//  PapagoTranslator.swift
//  PapagoTranslator
//
//  Created by moon on 19/09/2019.
//  Copyright © 2019 Bugking. All rights reserved.
//

import UIKit
import SwiftyJSON

public class PapagoTranslator {

    /// API structure.
    private struct API {
       /// Base Google Vision API url.
       static let base = "https://openapi.naver.com/v1/language/translate"
       
       /// endpoint.
       struct translate {
           static let method = "POST"
           static let url = API.base
       }
    }
    
    enum PapagoError: Error, LocalizedError {
        case invaildUrl
        case equal
        
        public var errorDescription: String? {
            switch self {
            case .invaildUrl:
                return NSLocalizedString("invailded url", comment: "My error")
            case .equal:
                return NSLocalizedString("target and source are the same", comment: "Error")
            
            }
        }
    }
    
    private let headers:[String:String]!
    /// Default URL session.
    private let session = URLSession(configuration: .default)
    
    public init(id:String, secret:String) {
        assert(id != "", "Please enter X-Naver-Client-Id key")
        assert(secret != "", "Please enter X-Naver-Client-Secret key")
        headers = [
            "X-Naver-Client-Id": id,
            "X-Naver-Client-Secret" : secret
        ]
    }
    
    public func run(_ q:String, _ source:String, _ target:String, _ completion: @escaping ((_ text: String?, _ error: Error?) -> Void)) {
        if source == target {
            completion(q, PapagoError.equal)
            return
        }
        
        guard let url = URL(string: API.translate.url) else {
            completion(nil, PapagoError.invaildUrl)
            return
        }
        
        let parameter: [String: Any] = ["text":q, "source":source, "target":target]
        let parameterData = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        var request = URLRequest(url: url)
        request.httpMethod = API.translate.method
        request.allHTTPHeaderFields = headers
        request.httpBody = parameterData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data,                                // is there data
                error == nil else {                                // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            let json = try! JSON(data: data)
            if let errMessage = json["errorMessage"].string {
                completion(errMessage, nil)
                return
            }
            
            let result = json["message"]["result"]["translatedText"].stringValue
            completion(result, nil)
            
        }.resume()
    }
    
}
