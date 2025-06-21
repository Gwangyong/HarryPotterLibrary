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
    
    private var fullSummaryContentText: String = ""
    private var truncatedSummaryContentText: String = ""
    
    
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
    
    /// 주어진 Book 인스턴스의 summary 값을 기반으로 요약 내용을 표시하고,
    /// 길이에 따라 더보기 버튼의 표시 여부 및 라벨 상태를 설정하는 메서드
    /// - Parameter book: 요약 정보를 포함한 Book 인스턴스
    func configure(with book: Book) {
        isContentExpanded = UserDefaults.standard.bool(forKey: "summaryExpanded")
        
        let summary = book.summary
        fullSummaryContentText = summary // 요약 내용 전체
        truncatedSummaryContentText = "\(summary.prefix(450))..." // 450자 까지 끊음
        
        summaryContentLabel.numberOfLines = 0
        summarytoggleButton.isHidden = summary.count < 450
        
        updateSummaryUI()
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
    }
    
    // 더보기 버튼
    private func setupSummarytoggleButtonLayout() {
        summarytoggleButton.setTitleColor(.systemBlue, for: .normal)
        
        summarytoggleButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview() // leading은 자동. 우측에 붙여야하니
        }
    }
    
    private func updateSummaryUI() {
        summaryContentLabel.text = isContentExpanded ? fullSummaryContentText : truncatedSummaryContentText // 토글 상태에 따라 내용 변경
        summarytoggleButton.setTitle(isContentExpanded ? BookSummaryButtonLabel.collapse : BookSummaryButtonLabel.expand, for: .normal) // 토글 상태에 따라 버튼 이름 변경
    }
    
    // 더 보기 버튼 토글 액션함수
    @objc private func toggleButtonTapped() {
        isContentExpanded.toggle() // 상태 토글: false -> true, true -> false 전화
        updateSummaryUI()
        UserDefaults.standard.set(isContentExpanded, forKey: "summaryExpanded")
    }
    
    private enum BookSummaryButtonLabel {
        static let expand = "더 보기"
        static let collapse = "접기"
    }
}
