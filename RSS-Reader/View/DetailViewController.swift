//
//  DetailViewController.swift
//  RSS-Reader
//
//  Created by MBAir on 12/5/21.
//

import UIKit
import WebKit
import SnapKit

class DetailViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!
    
    //MARK:- Variables
    var link: String = ""
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        setupWebView()
    }
    
    //MARK:- Actions
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- UI Setup
extension DetailViewController {
    func setupConstraint() {
        closeButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        webView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func setupWebView() {
        webView.navigationDelegate = self
        guard let url = URL(string: link) else {
            return
        }
        startAnimating()
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

//MARK:- WebKit Delegate
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        stopAnimating()
    }
}

//MARK:- StoryBoard Initiable
extension DetailViewController: StoryboardInitiable{}

