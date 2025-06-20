//
//  BookSummaryView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/19/25.
// MARK: 책 요약 View

import UIKit
import SnapKit

final class BookSummaryView: UIView {
    private let verticalStackView = UIStackView()
    
    private let summaryTitleLabel = UILabel()
    private let summaryContentLabel = UILabel()
    
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
        
        [summaryTitleLabel, summaryContentLabel].forEach {
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupVerticalStackViewLayout()
        setupSummaryTitleLabelLayout()
        setupSummaryContentLabelLayout()
    }
    
    /// Book의 summary 속성을 summaryContentLabel에 설정하는 메서드
    /// - Parameter book: 요약 정보를 포함한 Book 인스턴스
    func configure(with book: Book) {
        summaryContentLabel.text = book.summary
    }
    
    // 세로 스택뷰(VerticalStackView) 제약조건 설정
    private func setupVerticalStackViewLayout() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        verticalStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
    
    // 요약 제목
    private func setupSummaryTitleLabelLayout() {
        summaryTitleLabel.text = BookSectionTitle.summary // "Summary"
        summaryTitleLabel.font = .boldSystemFont(ofSize: 18)
        summaryTitleLabel.textColor = .black
        summaryTitleLabel.numberOfLines = 1
    }
    
    // 요약 내용
    private func setupSummaryContentLabelLayout() {
        summaryContentLabel.font = .systemFont(ofSize: 14)
        summaryContentLabel.textColor = .darkGray
        summaryContentLabel.numberOfLines = 0
        summaryContentLabel.lineBreakMode = .byWordWrapping
    }
}
