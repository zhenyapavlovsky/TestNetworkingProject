//
//  ContentView.swift
//  TestNetworkingProject
//
//  Created by Vasyl Nadtochii on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("`\(viewModel.output)`")
                .font(.system(size: 16, weight: .regular))
            Button {
                viewModel.onButtonTapped()
            } label: {
                Text("Perform Test Request")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
