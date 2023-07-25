//
//  ViewController.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import UIKit

class AlbumsViewController: UIViewController {

    // MARK: - Outlets
    
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupView()
        setupHeirarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .add)
    }

    private func setupView() {
        title = "Albums"
        view.backgroundColor = .white
    }
    
    private func setupHeirarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}

