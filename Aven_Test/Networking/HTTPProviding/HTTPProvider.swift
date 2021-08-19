//
//  HTTPProvider.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

final class HTTPProvider: HTTPProviding {
    private let session: URLSession
    private var dataTask: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    func task(request: URLRequest, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        dataTask = session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        dataTask?.resume()
    }
}
