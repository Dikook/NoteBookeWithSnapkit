//
//  NoteViewCustomCell.swift
//  testSnapkit
//
//  Created by Diar Orynbek on 06.07.2024.
//

import UIKit
import SnapKit

class NoteViewCustomCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "reuseID"
    
    
    // MARK: - UI contructors
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    // MARK: - SetupLayouts
    func setupLayouts() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(14)
            make.leading.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.leading.equalTo(20)
        }
    
    }
    
    // MARK: - Functions
    public func configure(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
