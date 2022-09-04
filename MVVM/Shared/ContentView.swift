//
//  ContentView.swift
//  Shared
//
//  Created by 이득령 on 2022/09/03.
//

import SwiftUI

import SwiftUI

//MARK: - Models

struct Person {
    var name: String
    var birthday: Date
    
}

struct ContentView: View {
    
@StateObject var viewModel = ContentViewModel()
    @State private var name = ""
    
    var body: some View {
        
        VStack{
            Text(viewModel.name)
                .padding()
            TextField("이름", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 50)
            Button {
                viewModel.changeName("\(name)")
            } label: {
                Text("이름변경")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(20)
                    
            }

        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
