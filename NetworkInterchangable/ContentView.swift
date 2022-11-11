//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Tunay Toksöz on 11.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var listUserViewModel : ListUserViewModel
    
    init(){
        self.listUserViewModel = ListUserViewModel(service: Webservice())
    }
    
    var body: some View {
        List(listUserViewModel.userList, id: \.id){
            user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.userName)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await listUserViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
