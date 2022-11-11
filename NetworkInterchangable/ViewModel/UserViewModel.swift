//
//  UserViewmodel.swift
//  NetworkInterchangable
//
//  Created by Tunay Toksöz on 11.11.2022.
//

import Foundation

class ListUserViewModel : ObservableObject {
    
    @Published var userList = [userViewModel]()
    
   // let webService = Webservice()
    
    private var service : NetworkService
    init(service: NetworkService){
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        
        if service.type == "WebService" {
            resource = Constants.URLs.usersExtension
        } else {
            resource = Constants.Paths.baseURL
        }
        
        do{
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(userViewModel.init)
            }
        } catch{
            print(error)
        }
    }
}

struct userViewModel {
    let user : User
    
    var id : Int {
        user.id
    }
    var name : String {
        user.name
    }
    var userName : String {
        user.username
    }
    var email : String {
        user.email
    }
}
