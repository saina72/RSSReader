//
//  StoryViewController.swift
//  RSS-Reader
//
//  Created by MBAir on 12/6/21.
//

import UIKit
import FeedKit
import RxSwift

class StoryViewController: UIViewController {
    
    //MARK:- Variables
    //UI
    let tableView = UITableView()
    //Code
    var feedData: [RSSFeedItem] = []
    private var dataSource: FeedTableViewDataSource<FeedTableViewCell, RSSFeedItem>!
    let detailVC: DetailViewController = DetailViewController()
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        updateDataSource()
    }
}

//MARK:- UI Setup
extension StoryViewController {
    func setupUIElements() {
        self.title = "Story"
        self.view.addSubview(tableView)
        tableView.delegate = self
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

//MARK:- TableView DataSource
extension StoryViewController {
    func updateDataSource() {
        self.dataSource = FeedTableViewDataSource(cellIdentifier: "FeedTableViewCell", items: self.feedData, configureCell: { cell, item in
            cell.titleLabel.text = item.title
            cell.moreIcon.isHidden = true
            if item.media != nil {
                if item.media?.mediaGroup != nil {
                    if item.media?.mediaGroup?.mediaContents?.count ?? 0 > 0 {
                        if item.media?.mediaGroup?.mediaContents?[0].attributes != nil {
                            cell.imageViewHeight.constant = 200
                            cell.feedImageView?.sd_setImage(with: URL(string: item.media?.mediaGroup?.mediaContents?[0].attributes?.url ?? ""), placeholderImage: UIImage())
                        }
                    }
                }
            } else {
                cell.imageViewHeight.constant = 0
            }
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}

//MARK:- TableView Delegate
extension StoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.detailVC.link = feedData[indexPath.row].link ?? ""
        self.present(detailVC, animated: true, completion: nil)
    }
}

