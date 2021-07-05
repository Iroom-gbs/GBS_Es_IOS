//
//  AsckView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/06/30.
//

import SwiftUI
import WebKit

struct Webview: UIViewRepresentable
{ //자가진단 사이트 띄우는 WebView
    let url:URL = URL(string:"https://hcs.eduro.go.kr/#/loginHome")!

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView
    {
        print("Made UI")
        loadData()
        let preferences = WKPreferences()
            preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
    
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        
        
        

        return webview
    }
        
    func updateUIView(_ webview: WKWebView, context: Context)
    {
        print("Updated UI")
    }
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: Webview

        
        init(_ uiWebView:Webview) {
            self.parent = uiWebView
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
            print("Allow loading")
                decisionHandler(.allow)
        }

        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print("Start loading")
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Finish loading")
            let currentURL = webView.url?.absoluteString
            
            let timeInterval = NSDate().timeIntervalSince1970
            print(timeInterval-UserDefaults.standard.double(forKey:"Time"))
            
            if(Asckpw=="")
            {
                let request = URLRequest(url: URL(string:"http://20.41.76.129/ios/changepw")!, cachePolicy: .returnCacheDataElseLoad)
                webView.load(request)
            }
            
            if(currentURL == "https://hcs.eduro.go.kr/#/relogin") //로그인 페이지라면 메크로 가동
            {
                if(timeInterval-UserDefaults.standard.double(forKey:"Time")<180)
                {
                    let request = URLRequest(url: URL(string:"http://20.41.76.129/ios/threemin")!, cachePolicy: .returnCacheDataElseLoad)
                    webView.load(request)
                }
                else{UserDefaults.standard.set(timeInterval,forKey:"Time")}
                print(Adelay)
                print(Bdelay)
                print("Phase 1 Start")
                webView.evaluateJavaScript("document.getElementsByTagName(\"input\")[0].setRangeText(\"\(Asckpw)\")")
                webView.evaluateJavaScript("document.getElementById(\"btnConfirm\").click()")
                DispatchQueue.main.asyncAfter(deadline: .now() + Adelay) {
                webView.evaluateJavaScript("document.getElementsByTagName(\"a\")[1].click()")
                print("Phase 1 Finsh")
                print("Phase 2 Start")
                DispatchQueue.main.asyncAfter(deadline: .now() + Bdelay) {
                webView.evaluateJavaScript("document.getElementById(\"survey_q1a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"survey_q2a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"survey_q3a1\").click()")
                webView.evaluateJavaScript("document.getElementById(\"btnConfirm\").click()")
                print("Phase 2 Finish")
                    }
                }
            }
        }
    }
}

