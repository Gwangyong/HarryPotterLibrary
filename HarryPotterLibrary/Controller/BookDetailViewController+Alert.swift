//
//  BookDetailViewController+Alert.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/17/25.
// MARK: - Alert Controller

import UIKit

extension BookDetailViewController {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
