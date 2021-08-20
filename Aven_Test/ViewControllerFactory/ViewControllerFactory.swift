//
//  ViewControllerFactory.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

// The ViewControllerFactory is responsible for building view controllers and the dependencies that they will need.
final class ViewControllerFactory {
    private let networkRequester: NetworkRequesting
    
    init() {
        // Create the model provider and http provider for the network requester and save a pointer to the network requester to inject into view controllers that may need it.
        let modelProvider: ModelProviding = ModelProvider()
        let httpProvider: HTTPProviding = HTTPProvider(session: URLSession(configuration: .default))
        
        networkRequester = NetworkRequester(modelProviding: modelProvider, httpProviding: httpProvider)
    }
    
    func organizationsViewController() -> UIViewController {
        // Here is where the dependencies specific for the organizations view controller are created and injected.
        // The service takes in a network requester as a dependency which in turn takes in a model serializer and http provider as dependencies.
        // The service is then injected into the view model and then the view model into the view controller.
        let organizationsService: OrganizationsService = OrganizationsServiceAPI(networkRequester: networkRequester)
        let organizationsViewModel = OrganizationsViewModel(service: organizationsService)
        let organizationsController = OrganizationsViewController(viewModel: organizationsViewModel)
        let controller = UINavigationController(rootViewController: organizationsController)
        return controller
    }
}
