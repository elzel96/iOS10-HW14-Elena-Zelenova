//
//  CellHeader.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

class CellHeader: UICollectionReusableView {
    
    static let identifier = "CellHeader"
    
     var title: String? {
         didSet {
             titleLabel.text = title
         }
     }
    
     var buttonIsHiden: Bool? {
         didSet {
             button.isHidden = buttonIsHiden ?? true
         }
     }

     // MARK: - Outlets

     private let separator: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray3
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

     private let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         label.textAlignment = .left
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     private let button: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Все", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
         button.isHidden = false
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()

     // MARK: - Initializers

     override init(frame: CGRect) {
         super.init(frame: frame)
         isUserInteractionEnabled = true
         setupHierarchy()
         setupLayout()
     }

     required init?(coder: NSCoder) {
         fatalError("Error in Cell")
     }

     // MARK: - Setups

     private func setupHierarchy() {
         addSubview(separator)
         addSubview(titleLabel)
         addSubview(button)
     }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.topAnchor.constraint(equalTo: self.topAnchor),
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
 }
