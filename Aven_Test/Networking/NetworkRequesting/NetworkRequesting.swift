//
//  NetworkRequesting.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

typealias ResponseResult<T> = Result<T, Error>

protocol NetworkRequesting {
    func request<ModelType: Codable>(for endpoint: RestEndpoint, completion: @escaping (ResponseResult<ModelType>) -> Void)
}
