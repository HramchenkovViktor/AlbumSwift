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
    private var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        Task {
            await loadData()
        }
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
    func loadData() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            guard (200..<300).contains(httpResponse.statusCode) else { return }
            
            let loadedAlbums = try JSONDecoder().decode([Album].self, from: data)
            
            if let firstAlbim = albums.first {
                await MainActor.run {
                    self.titleLabel.text = firstAlbim.title
                }
            }
            
        } catch {
            print(error)
        }
    }
   



}

