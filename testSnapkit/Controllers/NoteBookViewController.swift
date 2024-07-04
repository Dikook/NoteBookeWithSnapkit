//
//  NoteBookViewController.swift
//  testSnapkit
//
//  Created by Diar Orynbek on 04.07.2024.
//

import UIKit
import SnapKit

class NoteBookViewController: UIViewController {
    
    // MARK: - Model
    var product = ["Воспоминание", "Входящий", "Идея", "Планы"]
    var countOfNotes = ["(4)", "(2)", "(5)", "(2)"]
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NoteBooks" // это title сверху таблицы
        navigationController?.navigationBar.prefersLargeTitles = true // а это делает его большим и слева ставить
        
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
extension NoteBookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("errro with CustomCell")
        }
        cell.configure(label: product[indexPath.row], count: countOfNotes[indexPath.row])
        
        return cell
    }
}
