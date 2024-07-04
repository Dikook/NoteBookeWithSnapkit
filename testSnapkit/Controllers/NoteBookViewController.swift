//
//  NoteBookViewController.swift
//  testSnapkit
//
//  Created by Diar Orynbek on 04.07.2024.
//

import UIKit
import SnapKit

final class NoteBookViewController: UIViewController {
    
    // MARK: - Variables
    var product = ["Входящий", "Идея", "Планы"]
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseID")
        tableView.dataSource = self
        return tableView
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraits()
    }
    
    // MARK: - Setup Views
    func setupViews() {
        view.addSubview(tableView)
    }
    
    // MARK: - Setup Constraits
    func setupConstraits() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: - Extension
extension NoteBookViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath)
        cell.textLabel?.text = product[indexPath.row]
        return cell
    }
}


