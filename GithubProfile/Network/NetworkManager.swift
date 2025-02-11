//
//  NetworkManager.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 05/02/25.
//

import Foundation

enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

enum NetworkRoute{
    case user(String)
    case repository(String)
    case commit(String, String)
    
    var url: URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        
        switch self {
        case .user(let user):
            components.path = "/users/\(user)"
        case .repository(let user):
            components.path = "/users/\(user)/repos"
        case .commit(let user, let repo):
            components.path = "/repos/\(user)/\(repo)/commits"
        }
        return components.url
    }
}

protocol NetworkManager{
    func getUser(forName name: String) async throws -> User
    func getRepo(forName name: String) async throws -> [Repository]
    func getCommit(forUser user: String, forRepo repo : String) async throws -> [Commit]
}

class NetworkManagerImp: NetworkManager{
   
    private var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private func fetchRequest<T: Decodable>(from url: URL?) async throws -> T {
        
        guard let url = url else{
           throw ApiError.invalidUrl
        }
        let (data , response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ApiError.invalidResponse
        }
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    func getUser(forName name: String) async throws -> User {
        return try await fetchRequest(from: NetworkRoute.user(name).url)
    }
    
    func getRepo(forName name: String) async throws -> [Repository] {
        return try await fetchRequest(from: NetworkRoute.repository(name).url)
    }
    func getCommit(forUser user: String, forRepo repo: String) async throws -> [Commit] {
        return try await fetchRequest(from: NetworkRoute.commit(user, repo).url)
    }
   
}
