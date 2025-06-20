//
//  BookDedicationView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/19/25.
// MARK: - 책 헌정사 View

import UIKit
import SnapKit

final class BookDedicationView: UIView {
    private let verticalStackView = UIStackView()
    
    private let dedicationTitleLabel = UILabel()
    private let dedicationContentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 뷰 계층 구성
    private func setupUI() {
        addSubview(verticalStackView)
        
        [dedicationTitleLabel, dedicationContentLabel].forEach {
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupVerticalStackViewLayout()
        setupDedicationTitleLabelLayout()
        setupDedicationContentLabelLayout()
    }
    
    /// Book의 dedication 속성을 dedicationContentLabel에 설정하는 메서드
    /// - Parameter book: 헌정사 정보를 포함한 Book 인스턴스
    func configure(with book: Book) {
        dedicationContentLabel.text = book.dedication
    }
    
    // 세로 스택뷰(VerticalStackView) 제약조건 설정
    private func setupVerticalStackViewLayout() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8 // 타이틀(Dedication)과 헌정사(내용) 사이 간격 8
        
        verticalStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }

    // 타이틀 제목
    private func setupDedicationTitleLabelLayout() {
        dedicationTitleLabel.font = .boldSystemFont(ofSize: 18)
        dedicationTitleLabel.textColor = .black
        dedicationTitleLabel.text = "Dedication"
        dedicationTitleLabel.numberOfLines = 1
    }
    
    // 타이틀 내용
    private func setupDedicationContentLabelLayout() {
        dedicationContentLabel.font = .systemFont(ofSize: 14)
        dedicationContentLabel.textColor = .darkGray
        dedicationContentLabel.numberOfLines = 0
    }
}
