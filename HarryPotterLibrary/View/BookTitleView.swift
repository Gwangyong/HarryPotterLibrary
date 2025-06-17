//
//  BookHeaderView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
// MARK: 책 제목 View

import UIKit
import SnapKit

final class BookTitleView: UIView {
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBookTitleLabelUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBookTitleLabelUI() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        // 텍스트 줄 수 제한 없이 필요한 만큼 줄바꿈
        titleLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
