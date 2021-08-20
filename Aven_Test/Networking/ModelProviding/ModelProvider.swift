//
//  ModelProvider.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import Foundation

final class ModelProvider: ModelProviding {
    func serializeData<ModelType: Decodable>(data: Data) -> ModelType? {
        do {
            let result = try JSONDecoder().decode(ModelType.self, from: data)
            return result
        } catch(let error) {
            print(error)
            return nil
        }
    }
}
