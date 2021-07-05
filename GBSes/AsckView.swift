//
//  AsckView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/06/30.
//

import SwiftUI
import WebKit

struct AsckContentView: View {
    @State var showingAlert: Bool
    var body: some View {
        Webview(url: URL(string:"https://hcs.eduro.go.kr/#/loginHome")!)
    }
}



struct Webview: UIViewRepresentable
{ //자가진단 사이트 띄우는 WebView
    var url:URL

    
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
            if(currentURL == "https://hcs.eduro.go.kr/#/relogin") //로그인 페이지라면 메크로 가동
            {
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
            else //로그인 페이지 아니면 수동으로 해달라는 알람을 띄움
            {
                
            }
        }
    }
}

