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
                    destination: Webview())
                {
                    Text(FirstAsck ? "자가진단하기":"수동자가진단(최초1회)") //버튼 제작시 Image로 변경 예정
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom,10)
                }
                NavigationLink(
                    destination: SettingView())
                {
                    Text("설정")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom,10)
                }
                NavigationLink(destination: CreditView())
                {
                    Text("IROOM : GBSessential")
                        .fontWeight(.heavy)
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Text("IROOM is freeRiding Our OptimuM project")
                    .font(.caption)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }.onAppear(){loadData()}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainContentView()
        }
    }
}

