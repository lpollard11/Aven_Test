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
    private enum Constants {
        static let baseURL = "https://api.github.com"
    }
    
    private let modelProviding: ModelProviding
    private let httpProviding: HTTPProviding
    
    // Inject these dependencies for testing and flexibility.
    // This is the top of the dependency chain.
    // The model provider serializes the incoming data from the http provider into model objects.
    // The http provider takes in a url request and downloads the data and has a completion block that returns data or an error.
    // The network requester uses all of these dependencies to create a request using an incoming endpoint object.
    // The public function of the network requester is generic so that the network requester can fetch different types of model objects as long as they adhere to the Decodable protocol.
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
        var url = URL(string: Constants.baseURL)!
        url.appendPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        return request
    }
}
