//
//  TableCell.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

final class TableCell: UICollectionViewCell {
    
    static let identifier = "TableCell"
    
    // MARK: - Outlets
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var lineSeparator: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberPhotosLabel)
        contentView.addSubview(button)
        contentView.addSubview(lineSeparator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 28),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            lineSeparator.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator.topAnchor.constraint(equalTo: topAnchor),
            lineSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            
            button.heightAnchor.constraint(equalToConstant: 28),
            button.widthAnchor.constraint(equalToConstant: 28),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -3),
            
            numberPhotosLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberPhotosLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -1)
        ])
    }
}


