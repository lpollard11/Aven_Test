//
//  OrganizationsAPI.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

final class OrganizationsServiceAPI: OrganizationsService {
    private let networkRequester: NetworkRequesting
    
    // Inject the network requester into a service that is specifically responsible for fetching organization objects.
    init(networkRequester: NetworkRequesting) {
        self.networkRequester = networkRequester
    }
    
    // Call the network requester with an organizations endpoint object and pass in a completion block with a specific Decodable type (OrganizationList).
    func organizations(completion: @escaping (ResponseResult<[Organization]>) -> Void) {
        networkRequester.request(for: OrganizationsEndpoint(), completion: completion)
    }
}
