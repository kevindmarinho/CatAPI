//
//  CatView.swift
//  CatAPI
//
//  Created by kevin marinho on 01/12/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel = CatViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.cats.filter { !$0.breeds.isEmpty }) { cat in
                HStack {
                    AsyncImage(url: cat.url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }

                    VStack(alignment: .leading) {
                        ForEach(cat.breeds) { breed in
                            Text(breed.name)
                                .font(.headline)
                                .padding(.top, 8)
                        }
                    }
                }
            }

            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Cats")
        }
        .onAppear {
            viewModel.fetchCats()
           // viewModel.fetchBreeds()
        }
    }
}

#Preview {
    CatView()
}
