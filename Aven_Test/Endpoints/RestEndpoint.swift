//
//  RestEndpoint.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

enum RestMethod: String {
    case GET
}

protocol RestEndpoint {
    var path: String { get }
    var method: RestMethod { get }
}
