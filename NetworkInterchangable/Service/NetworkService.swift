//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Tunay Toksöz on 11.11.2022.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}


