//
//  Model.swift
//  RSS-Reader
//
//  Created by MBAir on 12/3/21.
//

import FeedKit
import RxSwift

struct Feed {
    let title: String
    let imageUrl: String
    let items: [RSSFeedItem]
}
