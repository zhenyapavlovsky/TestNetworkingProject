//
//  DomainModelConvertible.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import Foundation

protocol DomainModelConvertible: Codable {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
}
