//
//  DessertDetailsView.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import SwiftUI

struct DessertDetailsView: View {
    @StateObject private var viewModel = DessertViewModel()
    let dessertID: String
    
    var body: some View {
        VStack() {
            if viewModel.isLoading {
                ProgressView("Cooking...")
                
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                
            } else if let dessert = viewModel.dessertDetails {
                ScrollView {
                    VStack(alignment: .center, spacing: 8) {
                        Text(dessert.name)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        
                        AsyncImage(url: dessert.thumbnail) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Steps:")
                                .font(.headline)
                            
                            Text(dessert.instructions)
                            
                            Text("Ingredients & Measurements:")
                                .font(.headline)
                                .padding(.top)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(Array(zip(dessert.ingredients, dessert.measurements)), id: \.1) { ingredient, measurement in
                                    Text("• \(measurement) \(ingredient)")
                                }
                            }
                        }
                        
                        if let youtubeURL = dessert.youtubeURL {
                            HStack(spacing: 36) {
                                Text("Watch on YouTube")
                                    .font(.headline)
                                
                                Button {
                                    if let url = URL(string: "\(youtubeURL)") {
                                        UIApplication.shared.open(url)
                                    }
                                } label: {
                                    if let youtubeURL = dessert.youtubeURL {
                                        YouTubeThumbnailView(videoID: "\(youtubeURL)")
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        if let sourceURL = dessert.source {
                            Link(destination: sourceURL, label: {
                                Text("Credit and Source").underline()
                            })
                        }
                    }
                }
            }
        }
        .padding(8.0)
        .task {
            await viewModel.fetchDessertDetail(by: dessertID)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DessertDetailsView(dessertID: "53049")
}

