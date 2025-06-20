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
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Book의 title 속성을 BookTitleView의 titleLabel에 설정하는 메서드
    /// - Parameter book: 제목 정보를 포함한 Book 인스턴스
    func configure(with book: Book) {
        titleLabel.text = book.title
    }
    
    // MARK: - 뷰 계층 구성
    private func setupUI() {
        addSubview(titleLabel)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        // 텍스트 줄 수 제한 없이 필요한 만큼 줄바꿈
        titleLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
