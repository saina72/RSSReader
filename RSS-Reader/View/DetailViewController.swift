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
    
    //MARK:- Variables
    //UI
    let webView = WKWebView()
    let closeButton = UIButton()
    //Code
    var link: String = ""
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK:- Actions
    @objc func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- UI Setup
extension DetailViewController {
    func setupUI() {
        view.backgroundColor = .white
        setupCloseButton()
        setupWebView()
        setupConstraint()
    }
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
        self.view.addSubview(webView)
        guard let url = URL(string: link) else {
            return
        }
        startAnimating()
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    func setupCloseButton() {
        closeButton.setImage(UIImage(named: "close_icon"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        self.view.addSubview(closeButton)
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

