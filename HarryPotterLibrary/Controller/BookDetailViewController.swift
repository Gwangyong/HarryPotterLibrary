//
//  ViewController.swift
//  HarryPotterLibrary
//
//  Created by 서광용 on 6/13/25.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private let dataService = DataService()
    private let bookHeaderView = BookHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        

    }
    

    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            // self가 살아있는지 확인하고, 살아있을 때만 코드 실행하는 안전장치
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                self.bookHeaderView.setTitle(books[0].title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

