//
//  OrganizationsService.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

protocol OrganizationsService {
    func organizations(completion: @escaping (ResponseResult<[Organization]>) -> Void)
}
