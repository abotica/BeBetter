//
//  PostRequest.swift
//  BeBetter
//
//  Created by Andrija Botica on 12.12.2023..
//



import Foundation

class KorisnikViewModel: ObservableObject {
    @Published var korisnik: Korisnik = Korisnik(name: "", surname: "", username: "", email: "", password: "", confirmPassword: "")

    func sendDataToServer() {
        guard let url = URL(string: "http://192.168.0.12:8080/korisnik") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(korisnik)
            request.httpBody = jsonData
        } catch {
            print("Error encoding data: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                // Handle the response status code and update UI accordingly
                // You may want to use Combine or DispatchQueue to update the UI on the main thread
            }

            // Handle the response data if needed
            // For example, you might decode the response data to see if the request was successful
            // let decodedData = try? JSONDecoder().decode(YourDecodableType.self, from: data)
        }

        task.resume()
    }
    
    
}

