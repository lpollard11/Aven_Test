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
    private let openURL: (URL) -> Void
    
    init(organization: Organization, openURL: @escaping (URL) -> Void) {
        self.organization = organization
        self.openURL = openURL
    }
    
    @objc func urlTapped() {
        guard let url = URL(string: url) else {
            return
        }
        openURL(url)
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
