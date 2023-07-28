//
//  AlbumCell.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

final class AlbumCell: UICollectionViewCell {
    
    static let identifier = "AlbumCell"
    
    // MARK: - Outlets
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
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
        contentView.addSubview(photoImageView)
        contentView.addSubview(namePhotoLabel)
        contentView.addSubview(numberPhotosLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            namePhotoLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 5),
            
            numberPhotosLabel.topAnchor.constraint(equalTo: namePhotoLabel.bottomAnchor, constant: 5)
        ])
    }
    
    func configureCell(item: Model) {
        photoImageView.image = UIImage(named: item.image)
        namePhotoLabel.text = item.title
        numberPhotosLabel.text = item.number
    }
}



