//
//  HTTPProviding.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

protocol HTTPProviding {
    func task(request: URLRequest, completion: @escaping ((Data?, URLResponse?, Error?) -> Void))
}
