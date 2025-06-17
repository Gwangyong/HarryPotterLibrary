//
//  BookDetailViewController+TopTabLayout.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
// MARK: 탭 버튼 Controller

extension BookDetailViewController {
    func setupTopTabLayout() {
        bookTopTabView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(bookTitleView.titleLabel.snp.bottom).offset(16)
        }
    }
}
