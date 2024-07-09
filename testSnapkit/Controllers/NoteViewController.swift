//
//  NoteViewController.swift
//  testSnapkit
//
//  Created by Diar Orynbek on 04.07.2024.
//

import UIKit
import SnapKit

class NoteViewController: UIViewController {
    
    // MARK: - Product
    var titleProduct = ["Приложение", "Айкумыс", "Ерс"]
    var descriptionProduct = ["как же это много", "узнать основы", "квартира"]
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NoteViewCustomCell.self, forCellReuseIdentifier: NoteViewCustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true

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
extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        4
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteViewCustomCell.identifier, for: indexPath) as? NoteViewCustomCell else {
            fatalError("Error with Custom Cell- 2")
        }
        cell.configure(title: titleProduct[indexPath.row], description: descriptionProduct[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}


