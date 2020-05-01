//
//  Api.swift
//  ApiListView
//
//  Created by Milen Pivchev on 05.04.20.
//  Copyright © 2020 Milen Pivchev. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    typealias AlbumsResponse = (Albums?, Error?) -> Void
    typealias PhotosResponse = (Photos?, Error?) -> Void
    typealias CommentsResponse = (Comments?, Error?) -> Void

    private static let decoder = JSONDecoder()
    
    static func getAlbums(completion: @escaping AlbumsResponse) {
        AF.request("https://jsonplaceholder.typicode.com/albums").validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let json = response.data {
                do {
                    completion(try decoder.decode(Albums.self, from: json), nil)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    static func getPhotos(completion: @escaping PhotosResponse) {
        AF.request("https://jsonplaceholder.typicode.com/photos").validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let json = response.data {
                do {
                    completion(try decoder.decode(Photos.self, from: json), nil)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    static func getComments(completion: @escaping CommentsResponse) {
        AF.request("https://jsonplaceholder.typicode.com/comments").validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let json = response.data {
                do {
                    completion(try decoder.decode(Comments.self, from: json), nil)
                } catch {
                    print(error)
                }
            }
        }
    }
}
