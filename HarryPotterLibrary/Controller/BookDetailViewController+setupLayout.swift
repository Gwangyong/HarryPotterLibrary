//
//  BookDetailViewController+setupLayout.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/16/25.
//

extension BookDetailViewController {
  func setupLayout() {
    view.addSubview(bookHeaderView)
    bookHeaderView.snp.makeConstraints {
        $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        $0.leading.trailing.equalToSuperview().inset(20)
    }
  }
}
