//
//  OrganizationCellViewModel.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

final class OrganizationCellViewModel {
    var refreshImage: ((UIImage?) -> Void)?
    
    var name: String {
        return organization.name
    }
    
    var description: String? {
        return organization.description
    }
    
    var url: String {
        return organization.url
    }
    
    private var image: UIImage? {
        didSet {
            refreshImage?(image)
        }
    }
    
    private let organization: Organization
    
    init(organization: Organization) {
        self.organization = organization
    }
    
    func loadImage() {
        guard image == nil else {
            refreshImage?(image)
            return
        }
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: self.organization.imageURL),
                  let data = try? Data(contentsOf: imageURL),
                  let image = UIImage(data: data) else {
                return
            }
            self.image = image
        }
    }
}
