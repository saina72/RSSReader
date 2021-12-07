//
//  FeedViewModel.swift
//  RSS-Reader
//
//  Created by MBAir on 12/3/21.
//

import FeedKit
import RxSwift

class FeedViewModel: NSObject {
    //MARK:- Variables
    private var apiService: APIService!
    private(set) var feedData: PublishSubject<[Feed]> = PublishSubject() {
        didSet {
            self.bindFeedViewModelToController()
        }
    }
    let loading: PublishSubject<Bool> = PublishSubject()
    var bindFeedViewModelToController : (() -> ()) = {}
    
    //MARK:- Initialization
    override init() {
        super.init()
        self.apiService = APIService()
        callFunctionToGetData()
    }
    
    //MARK:- API Call
    func callFunctionToGetData() {
        self.loading.onNext(true)
        self.apiService.getFeedData(completion: { data in
            self.loading.onNext(false)
            self.feedData.onNext(data)
        })
    }
}
