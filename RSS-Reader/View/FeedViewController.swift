//
//  ViewController.swift
//  RSS-Reader
//
//  Created by MBAir on 12/3/21.
//

import UIKit
import FeedKit
import RxSwift
import RxCocoa
import SDWebImage
import SnapKit


class FeedViewController: UIViewController {
    
    //MARK:- Variables
    //UI
    let tableView = UITableView()
    //Code
    private var feedViewModel: FeedViewModel!
    let storyVC: StoryViewController = StoryViewController()
    let disposeBag = DisposeBag()
    var feedData = PublishSubject<[Feed]>()
    
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIElements()
        bindViewModel()
    }
}

//MARK:- Binding
extension FeedViewController {
    func bindViewModel() {
        self.feedViewModel = FeedViewModel()
        feedViewModel.loading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        feedViewModel
            .feedData
            .observe(on: MainScheduler.instance)
            .bind(to: self.tableView.rx.items(cellIdentifier: "FeedTableViewCell", cellType: FeedTableViewCell.self), curriedArgument: { (row, item, cell) in
                cell.titleLabel.text = item.title
                cell.contentView.backgroundColor = UIColor.cellBackgroundColor[row%4]
                if item.imageUrl != "" {
                    cell.imageViewHeight.constant = 200
                    cell.feedImageView?.sd_setImage(with: URL(string: item.imageUrl), placeholderImage: UIImage())
                } else {
                    cell.imageViewHeight.constant = 0
                }
            })
            .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Feed.self).subscribe(onNext: { item in
            print(item)
            self.storyVC.feedData = item.items
            self.navigationController?.pushViewController(self.storyVC, animated: true)
        }).disposed(by: disposeBag)
        
        self.feedViewModel.callFunctionToGetData()
    }
}

//MARK:- UI Setup
extension FeedViewController {
    func setupUIElements() {
        self.title = "Feed"
        self.view.addSubview(tableView)
        tableView.register(nibName: "FeedTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        tableView.snp.makeConstraints({ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        })
    }
}
