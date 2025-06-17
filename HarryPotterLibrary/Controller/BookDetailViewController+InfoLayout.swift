//
//  BookDetailViewController+InfoLayout.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: 책 정보 배치 Controller

extension BookDetailViewController {
    func setupBookInfoLayout() {
        bookDetailView.bookInfoView.snp.makeConstraints {
            // safeArea에서 5만큼 떨어진것과 동일
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.top.equalTo(bookDetailView.bookTopTabView.snp.bottom).offset(16)
        }
    }
}
