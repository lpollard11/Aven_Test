//
//  NetworkRequester.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

enum ResponseError: Error {
    case invalidData
    case network
}

final class NetworkRequester: NetworkRequesting {
    private let modelProviding: ModelProviding
    private let httpProviding: HTTPProviding
    
    init(modelProviding: ModelProviding,
         httpProviding: HTTPProviding) {
        self.modelProviding = modelProviding
        self.httpProviding = httpProviding
    }
    
    func request<ModelType: Decodable>(for endpoint: RestEndpoint,
                                       completion: @escaping (ResponseResult<ModelType>) -> Void) {
        let urlRequest = self.urlRequest(for: endpoint)
        httpProviding.task(request: urlRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(ResponseError.network))
                return
            }
            
            guard let model: ModelType = self?.modelProviding.serializeData(data: data) else {
                completion(.failure(ResponseError.invalidData))
                return
            }
            
            completion(.success(model))
        }
    }
    
    private func urlRequest(for endpoint: RestEndpoint) -> URLRequest {
        var request = URLRequest(url: URL(string: endpoint.path)!)
        request.httpMethod = endpoint.method.rawValue
        return request
    }
}
