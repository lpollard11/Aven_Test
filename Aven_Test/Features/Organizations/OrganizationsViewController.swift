//
//  OrganizationsViewController.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

// The OrganizationsViewController is responsible for displaying a list of organizations on the screen or showing an error.
final class OrganizationsViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: OrganizationsViewModel
    
    init(viewModel: OrganizationsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupHandlers()
        viewModel.loadData()
    }
    
    private func setupHandlers() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.showError = { [weak self] error in
            DispatchQueue.main.async {
                self?.showError(error: error)
            }
        }
    }
    
    private func setupUI() {
        navigationItem.title = "Organizations"
    }
    
    private func setupTableView() {
        tableView.register(cell: OrganizationCell.self)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.addConstraints {[
            $0.topAnchor.constraint(equalTo: view.topAnchor),
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]}
    }
    
    private func showError(error: Error) {
        let alert = UIAlertController(title: "Oops!", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { [weak self] _ in
            self?.viewModel.loadData()
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension OrganizationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrganizationCell.identifier, for: indexPath) as! OrganizationCell
        cell.configure(with: viewModel.cellViewModel(for: indexPath))
        return cell
    }
}
