//
//  SettingView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/07/05.
//

import SwiftUI



struct SettingView: View {
    @State var UserInput:String = Asckpw
    @State var SlowInput:Bool = SlowMode
    let timeInterval = NSDate().timeIntervalSince1970
    var body: some View
    {
        VStack(alignment: .leading){
            HStack
            {
                Text("자가진단 비밀번호: ")
            
                TextField("비밀번호를 입력하세요",text: $UserInput, onCommit:
                {
                    UserDefaults.standard.set(UserInput, forKey:"Asckpw")
                    Asckpw = UserInput
                })
            }.onAppear(){UserInput = Asckpw}.padding(.horizontal)
            Text("비밀번호 입력 후 엔터키를 눌러주세요").font(.caption2).padding(.horizontal)
            
            Toggle(isOn:$SlowInput)
            {
                Text("고속모드 켜기")
            }.padding(.horizontal) .onChange(of:SlowInput)
            { value in
                UserDefaults.standard.set(!SlowInput, forKey:"Slowmode")
                SlowMode = SlowInput
            }
            
            Text("자가진단 속도가 빨라지는 대신 중간에 끊길 수 있습니다. (느린 인터넷 환경에서는 끄는 것을 추천합니다.)").font(.caption2).padding(.horizontal)
        }.onAppear(){SlowInput = SlowMode}
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
