//
//  Apollo.swift
//  HelloGraphQL
//
//  Created by Mohammad Azam on 5/10/21.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    private init() { }
    
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
}
