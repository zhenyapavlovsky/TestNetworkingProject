//
//  ContentViewModel.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var output = String()
    
    func onButtonTapped() {}
}

class ContentViewModelImpl: ContentViewModel {
    
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    override func onButtonTapped() {
        userService
            .getTestData()
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.output = error.localizedDescription
            } receiveValue: { [weak self] testDataValue in
                self?.output = "id: \(testDataValue.id), prop1: \(testDataValue.prop1), prop2: \(testDataValue.prop2)"
            }
            .store(in: &cancellables)
    }
}
