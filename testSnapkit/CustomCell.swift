//
//  CustomCell.swift
//  testSnapkit
//
//  Created by Diar Orynbek on 04.07.2024.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "reuseID"
    
    
    // MARK: - UI contructors
    private lazy var imageIconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "text.book.closed.fill")
        iv.tintColor = .label
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Воспоминание"
        return label
    }()
    
    private lazy var countNotes: UILabel = {
        let label = UILabel()
        label.text = "(4)"
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
        contentView.addSubview(imageIconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(countNotes)
    }
    
    // MARK: - SetupLayouts
    func setupLayouts() {
        imageIconView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.height.equalTo(30)
            make.leading.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(14)
            make.leading.equalTo(imageIconView.snp.leading).offset(30)
        }
        
        countNotes.snp.makeConstraints { make in
            make.top.equalTo(19)
            make.leading.equalTo(nameLabel.snp.trailing).offset(3)
            //make.trailing.equalTo(-20)
        }
    
    }
    
    // MARK: - Functions
    public func configure(label: String, count: String) {
        nameLabel.text = label
        countNotes.text = count
    }
}
