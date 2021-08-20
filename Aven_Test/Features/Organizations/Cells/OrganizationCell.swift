//
//  OrganizationCell.swift
//  Aven_Test
//
//  Created by Lee Pollard on 8/19/21.
//

import UIKit

final class OrganizationCell: UITableViewCell {
    private enum Constants {
        static let imageViewHeight: CGFloat = 50
        static let standardSpacing: CGFloat = 16
        static let tightSpacing: CGFloat = 8
        static let tighterSpacing: CGFloat = 4
    }
    
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let urlLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func configure(with viewModel: OrganizationCellViewModel) {
        viewModel.refreshImage = { [weak self] image in self?.avatarImageView.image = image }
        
        nameLabel.text = viewModel.name
        urlLabel.text = viewModel.url
        
        // Hide or show the description label depending on if the value exists.
        if let description = viewModel.description {
            descriptionLabel.text = description
            descriptionLabel.isHidden = false
        } else {
            descriptionLabel.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        avatarImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(avatarImageView)
        avatarImageView.addConstraints {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.standardSpacing),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.standardSpacing),
            $0.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight),
            $0.widthAnchor.constraint(equalToConstant: Constants.imageViewHeight),
        ]}
        
        // Use stack view to layout the labels of the cell so that the description label can be shown or hidden depending on if the value exists.
        let arrangedSubviews: [UIView] = [nameLabel, urlLabel, descriptionLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        
        contentView.addSubview(stackView)
        stackView.addConstraints {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.standardSpacing),
            $0.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.tightSpacing),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.standardSpacing),
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.standardSpacing)
        ]}
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.largeTitle)
        
//        contentView.addSubview(nameLabel)
//        nameLabel.addConstraints {[
//            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.tightSpacing),
//            $0.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.tighterSpacing)
//        ]}
        
        urlLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
//        contentView.addSubview(urlLabel)
//        urlLabel.addConstraints {[
//            $0.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.tighterSpacing),
//            $0.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.tighterSpacing)
//        ]}
        
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        descriptionLabel.numberOfLines = 0
        
//        contentView.addSubview(descriptionLabel)
//        descriptionLabel.addConstraints {[
//            $0.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: Constants.tighterSpacing),
//            $0.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.tighterSpacing),
//            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.tightSpacing),
//        ]}
    }
}
