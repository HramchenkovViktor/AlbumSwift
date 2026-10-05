//
//  ViewController.swift
//  AlbumSwift
//
//  Created by Виктор on 05.10.2026.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
    }



}

