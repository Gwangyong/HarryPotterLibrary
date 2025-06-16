//
//  BookHeaderView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
//

import UIKit
import SnapKit

final class BookHeaderView: UIView {
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        // 텍스트 줄 수 제한 없이 필요한 만큼 줄바꿈
        titleLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    
}
