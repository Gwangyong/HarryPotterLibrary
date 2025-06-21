//
//  BookSummaryView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/19/25.
// MARK: - 책 요약 View

import UIKit
import SnapKit

final class BookSummaryView: UIView {
    private let summaryStackView = UIStackView()
    
    private let summaryTitleLabel = UILabel()
    private let summaryContentLabel = UILabel()
    
    private let summaryButtonContainerView = UIView()
    private let summarytoggleButton = UIButton()
    private var isContentExpanded = false
    
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
        addSubview(summaryStackView)
        
        [summaryTitleLabel, summaryContentLabel, summaryButtonContainerView].forEach {
            summaryStackView.addArrangedSubview($0)
        }
        
        summaryButtonContainerView.addSubview(summarytoggleButton)
        summarytoggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupSummaryStackViewLayout()
        setupSummaryTitleLabelLayout()
        setupSummaryContentLabelLayout()
        setupSummarytoggleButtonLayout()
    }
    
    /// Book의 summary 속성을 summaryContentLabel에 설정하는 메서드
    /// - Parameter book: 요약 정보를 포함한 Book 인스턴스
    func configure(with book: Book) {
        summaryContentLabel.text = book.summary
    }
    
    // 세로 스택뷰(summaryStackView) 제약조건 설정
    private func setupSummaryStackViewLayout() {
        summaryStackView.axis = .vertical
        summaryStackView.spacing = 8
        
        summaryStackView.snp.makeConstraints {
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
        summaryContentLabel.numberOfLines = 1
        summaryContentLabel.lineBreakMode = .byWordWrapping
    }
    
    // 더보기 버튼
    private func setupSummarytoggleButtonLayout() {
        summarytoggleButton.setTitle(BookSummaryButtonLabel.expand, for: .normal)
        summarytoggleButton.setTitleColor(.systemBlue, for: .normal)
            
        summarytoggleButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview() // leading은 자동. 우측에 붙여야하니
        }
    }
    
    // 더 보기 버튼 토글 액션함수
    @objc private func toggleButtonTapped() {
        isContentExpanded.toggle() // 상태 토글: false -> true, true -> false 전화
        
        // 토글 상태에 따라서 표시 줄 수 변경 (true -> 전체 표시, false -> 1줄만 표시)
        summaryContentLabel.numberOfLines = isContentExpanded ? 0 : 1
        
        // 토글 상태에 따라 이름 변경 ("더 보기" <-> "접기")
        summarytoggleButton.setTitle(isContentExpanded ? BookSummaryButtonLabel.collapse : BookSummaryButtonLabel.expand, for: .normal)
    }
    
    private enum BookSummaryButtonLabel {
        static let expand = "더 보기"
        static let collapse = "접기"
    }
}
