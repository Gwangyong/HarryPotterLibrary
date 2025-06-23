//
//  BookChaptersView.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/20/25.
// MARK: - 목차 View

import UIKit
import SnapKit

class BookChaptersView: UIView {
    private let chaptersStackView = UIStackView()
    private let chaptersTitleLabel = UILabel()
    
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
        addSubview(chaptersStackView)
        chaptersStackView.addArrangedSubview(chaptersTitleLabel)
    }
    
    // MARK: - 제약조건 설정
    private func setupLayout() {
        setupChaptersStackViewLayout()
        setupChaptersTitleLabelLayout()
    }
    
    /// 전달받은 Book 인스턴스를 기반으로 챕터 목록을 UILabel로 생성하여 스택뷰에 추가하는 메서드
    /// - Parameter book: 챕터 정보가 포함된 Book 인스턴스
    func configure(with book: Book) {
        let chapters = book.chapters
        // configure가 여러번 호출 될 경우, 중복을 막기 위해 제거하는 코드
        chaptersStackView.arrangedSubviews
            .dropFirst() // 첫 번째는 제목 라벨(chaptersLabel)이니까 냅둠
            .forEach { $0.removeFromSuperview() }

        // 챕터들 반복해서 UILabel 생성 후 추가
        chapters.enumerated().forEach { index, chapter in
            let label = setupChapterLabelLayout(title: chapter.title)
            chaptersStackView.addArrangedSubview(label)
        }
    }
    
    // 세로 스택뷰(chaptersStackView) 제약조건 설정
    private func setupChaptersStackViewLayout() {
        chaptersStackView.axis = .vertical
        chaptersStackView.spacing = 8
        
        chaptersStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
    
    // 목차 제목
    private func setupChaptersTitleLabelLayout() {
        chaptersTitleLabel.text = BookSectionTitle.chapters // "Chapters"
        chaptersTitleLabel.font = .boldSystemFont(ofSize: 18)
        chaptersTitleLabel.textColor = .black
    }
    
    private func setupChapterLabelLayout(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }
}
