//
//  ModelProviding.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

protocol ModelProviding {
    func serializeData<ModelType: Decodable>(data: Data) -> ModelType?
}
