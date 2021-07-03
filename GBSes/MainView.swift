//
//  MainView.swift
//  메인화면
//  GBSes
//
//  Created by 박찬웅 on 2021/06/29.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                NavigationLink(
                    destination: Webview(url: URL(string: "https://hcs.eduro.go.kr/#/loginHome")!))
                {
                    Text("자가진단하기") //버튼 제작시 Image로 변경 예정
                        .font(.largeTitle)
                        .padding(.bottom,10)
                }
                Text("IROOM : GBSessential")
                    .padding(.bottom, 0.0)
                    .font(.title)
                    .foregroundColor(.blue)
                Text("IROOM is freeRiding Our OptimuM project")
                    .font(.caption)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainContentView()
        }
    }
}
