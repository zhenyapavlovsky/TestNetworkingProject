//
//  ServiceContainer.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import Foundation

class ServiceContainer {
    
    static let shared = ServiceContainer()
    
    lazy var userService = UserServiceImpl(executor: NetworkRequestExecutor())
}
