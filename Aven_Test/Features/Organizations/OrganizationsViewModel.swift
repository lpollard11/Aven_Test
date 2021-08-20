//
//  OrganizationsViewModel.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

// The OrganizationsViewModel is repsonsible for converting raw JSON objects into consumable view model objects, holding onto the generated organization cell view models, and returning necessary info on that data source.
final class OrganizationsViewModel {
    var rowCount: Int {
        return organizatons.count
    }
    
    var reloadData: (() -> Void)?
    var showError: ((Error) -> Void)?
    
    private var organizatons: [OrganizationCellViewModel] = []
    private let service: OrganizationsService
    
    init(service: OrganizationsService) {
        self.service = service
    }
    
    func loadData() {
        service.organizations { [weak self] result in
            switch result {
            case .success(let data):
                self?.dataReceived(data: data)
                self?.reloadData?()
            case .failure(let error):
                self?.showError?(error)
            }
        }
    }
    
    func cellViewModel(for indexPath: IndexPath) -> OrganizationCellViewModel {
        return organizatons[indexPath.row]
    }
    
    private func dataReceived(data: [Organization]) {
        organizatons = data.map { OrganizationCellViewModel(organization: $0, openURL: openURL) }
    }
    
    private func openURL(url: URL) {
        UIApplication.shared.open(url)
    }
}
