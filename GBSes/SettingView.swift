//
//  SettingView.swift
//  GBSes
//
//  Created by 박찬웅 on 2021/07/05.
//

import SwiftUI



struct SettingView: View {
    @State var UserInput:String = Asckpw
    var body: some View {
        HStack {
        Text("자가진단 비밀번호: ")
        TextField("비밀번호를 입력하세요",text: $UserInput, onCommit:
                    {
                        UserDefaults.standard.set(UserInput, forKey:"Asckpw")
                        Asckpw = UserInput
                    })
        }.onAppear(){
            UserInput = Asckpw
        }.padding(.horizontal)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
