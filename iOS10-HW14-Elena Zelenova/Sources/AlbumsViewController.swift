//
//  ViewController.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    private let model = DataManager.shared.createSectionModels()

    // MARK: - Outlets
    
    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
    }

    private func setupView() {
        title = "Альбомы"
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extensions

extension AlbumsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model[section].item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell
            item?.configureCell(item: model[indexPath.section].item[indexPath.item])
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
            item?.configureCell(item: model[indexPath.section].item[indexPath.item])
            return item ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.identifier, for: indexPath) as? CellHeader else { return UICollectionReusableView() }
        header.configureHeader(sectionModel: model[indexPath.section])
        return header
    }
}

extension AlbumsViewController {
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 6,
                    bottom: 0,
                    trailing: 6
                )
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(192),
                    heightDimension: .absolute(399)
                )
                
                let group: NSCollectionLayoutGroup
                
                if #available(iOS 16.0, *) {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: groupSize,
                        repeatingSubitem: item,
                        count: 2
                    )
                } else {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: groupSize,
                        subitem: item,
                        count: 2
                    )
                }
                
                group.interItemSpacing = .fixed(55)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = .zero
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 12,
                    bottom: 112,
                    trailing: 12
                )
                
                section.orthogonalScrollingBehavior = .paging
                
                let sectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(self.view.frame.width - 6),
                    heightDimension: .estimated(40)
                )
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 6,
                    bottom: 0,
                    trailing: 6)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(192),
                    heightDimension: .absolute(220)
                )
                
                let group: NSCollectionLayoutGroup
                
                if #available(iOS 16.0, *) {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: groupSize,
                        repeatingSubitem: item,
                        count: 1
                    )
                } else {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: groupSize,
                        subitem: item,
                        count: 1
                    )
                }
                
                group.interItemSpacing = .fixed(88)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = .zero
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 12,
                    bottom: 60,
                    trailing: 12
                )
                section.orthogonalScrollingBehavior = .paging
                
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 12,
                    bottom: 40,
                    trailing: 0
                )
                
                let sectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(self.view.frame.width - 6),
                    heightDimension: .estimated(40)
                )
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(52)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 0
                )
                
                let group: NSCollectionLayoutGroup
                
                if #available(iOS 16.0, *) {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: itemSize,
                        repeatingSubitem: item,
                        count: 1
                    )
                } else {
                    group = NSCollectionLayoutGroup.vertical(
                        layoutSize: itemSize,
                        subitem: item,
                        count: 1
                    )
                }
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 12,
                    bottom: 20,
                    trailing: 0
                )
                
                let sectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(self.view.frame.width - 6),
                    heightDimension: .estimated(40)
                )
                
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                
                section.boundarySupplementaryItems = [sectionHeader]
                return section
            }
        }
        return layout
    }
}

