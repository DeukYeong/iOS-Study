//
//  ViewModel.swift
//  MVVM (iOS)
//
//  Created by 이득령 on 2022/09/03.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var yeong = Person(name: "득령", birthday: Date())
    //퍼블리셔 없이는 이름 변경이 안된다
    
    var name: String {
        
        yeong.name
        
    }
    var age: String {
        
        //Date를 -> 나이로 변환
        return "19"
    }
    //MARK: - 이름 함수 생성
    
    func changeName(_ name: String) {
        yeong.name = name
    }
}
