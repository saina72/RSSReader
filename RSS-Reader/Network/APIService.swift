//
//  APIService.swift
//  RSS-Reader
//
//  Created by MBAir on 12/3/21.
//

import FeedKit
import RxSwift

class APIService :  NSObject {
    
    private let sourceURLs: [URL] = [URL(string: "http://rss.cnn.com/rss/cnn_topstories.rss")!,
                                     URL(string: "https://www.npr.org/rss/rss.php?id=1001")!,
                                     URL(string: "http://images.apple.com/main/rss/hotnews/hotnews.rss")!,
                                     URL(string: "http://rssfeeds.usatoday.com/usatoday-NewsTopStories")!,
                                     URL(string: "http://feeds1.nytimes.com/nyt/rss/Sports")!]
    
    //MARK:- Get RSSFeed Data
    func getFeedData(completion : @escaping ([Feed]) -> ()){
        var feedData: [Feed] = []
        for item in sourceURLs {
            let feedURL = item
            let parser = FeedParser(URL: feedURL)
            let result = parser.parse()
            switch result {
            case .success(let feed):
                let data = Feed(title: feed.rssFeed?.title ?? "", imageUrl: feed.rssFeed?.image?.url ?? "", items: feed.rssFeed?.items ?? [])
                feedData.append(data)
            case .failure(let error):
                print(error)
            }
        }
        completion(feedData)
    }
}
