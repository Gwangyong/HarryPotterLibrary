//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooks()
    }
    
    private let dataService = DataService()
    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                print("✅ books 로딩 성공: \(books.count)권")
                
                for book in books {
                    print("📘 \(book.title)")
                }
                
                
            case .failure(let error):
                print("실패")
            }
        }
    }
    
}

