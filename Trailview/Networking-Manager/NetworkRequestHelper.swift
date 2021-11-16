//
//  NetworkRequestHelper.swift
//  Trailview
//
//  Created by TrailViewers on 10/24/2021
//  Copyright © TrailViewers. All rights reserved.
//
//  TrailViewers: Anh Vu, Elizabeth Thorne, Mark Jordan, Reid William Strange
//  Date Modified: 10/26/2021
//

import Foundation


class NetworkRequestHelper {

    //  MARK: - HTTP "GET" Requests

    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let sharedSession = URLSession.shared

        let task = sharedSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }


    //  MARK: - HTTP "POST" Requests

    class func taskForPOSTRequest<RequestBody: Encodable, ResponseType: Decodable>(url: URL, body: RequestBody, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)

        let sharedSession = URLSession.shared

        let task = sharedSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }


    //  MARK: - HTTP "PUT" Requests

    class func taskForPUTRequest<RequestBody: Encodable, ResponseType: Decodable>(url: URL, body: RequestBody, responseType: ResponseType.Type, completionHandler: @escaping (ResponseType?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)

        let sharedSession = URLSession.shared

        let task = sharedSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }
        task.resume()
    }
}
