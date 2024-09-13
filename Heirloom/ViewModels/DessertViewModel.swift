//
//  DessertViewModel.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/11/24.
//

import Foundation

@MainActor
class DessertViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var dessertDetails: DessertDetails?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var sortAlphabeticalAscending: Bool = true
    
    // Keep track of tasks
    private var fetchTask: Task<Void, Never>? = nil
    
    // MARK: - Fetch All Desserts
    func fetchDesserts() async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        // Cancel ongoing fetch operation
        fetchTask?.cancel()
        
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL."
            isLoading = false
            return
        }
        
        fetchTask = Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode([String: [Dessert]].self, from: data)
                
                if let desserts = decodedResponse["meals"] {
                    let sortedDesserts = desserts.sorted { (sortAlphabeticalAscending ? $0.name < $1.name : $0.name > $1.name) }
                    self.desserts = sortedDesserts
                    
                } else {
                    errorMessage = "Failed parsing response."
                }
                
            } catch {
                errorMessage = "Failed fetching desserts: \(error.localizedDescription)"
            }
        }
    }
    
    // MARK: - Fetch Dessert Details by ID
    func fetchDessertDetail(by id: String) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL."
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([String: [DessertDetails]].self, from: data)
            
            if let dessertDetails = decodedResponse["meals"]?.first {
                self.dessertDetails = dessertDetails
                
            } else {
                errorMessage = "Failed parsing response."
            }
            
        } catch {
            errorMessage = "Failed fetching dessert details: \(error.localizedDescription)"
        }
    }
}
