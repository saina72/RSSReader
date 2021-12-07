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
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    private var feedViewModel: FeedViewModel!
    let disposeBag = DisposeBag()
    var feedData = PublishSubject<[Feed]>()
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
                cell.contentView.backgroundColor = row%4 == 0 ? UIColor.PaletteName.bgColor1.color : row%4 == 1 ? UIColor.PaletteName.bgColor2.color : row%4 == 2 ? UIColor.PaletteName.bgColor3.color : UIColor.PaletteName.bgColor4.color
                if item.imageUrl != "" {
                    cell.imageViewHeight.constant = 200
                    cell.feedImageView?.sd_setImage(with: URL(string: item.imageUrl), placeholderImage: UIImage())
                } else {
                    cell.imageViewHeight.constant = 0
                }
            })
            .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Feed.self).subscribe(onNext: { item in
            let storyVC: StoryViewController = UIStoryboard.main.instantiateViewController()
            storyVC.feedData = item.items
            self.navigationController?.pushViewController(storyVC, animated: true)
        }).disposed(by: disposeBag)
        
        self.feedViewModel.callFunctionToGetData()
    }
}

//MARK:- UI Setup
extension FeedViewController {
    func setupUIElements() {
        self.title = "Feed"
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
