//
//  URL+Extension.swift
//  Pods
//
//  Created by kanney on 2025/10/11.
//
import Kingfisher

extension URL {
    
    func getImageByURL() async -> UIImage? {
        return await withCheckedContinuation { seal in
            
            KingfisherManager.shared.retrieveImage(with: self) { result in
                switch result {
                case let .success(body):
                    seal.resume(returning: body.image)
                case let .failure(error):
                    
                    print(error.localizedDescription)
                    seal.resume(returning: nil)
                }
            }
        }
    }
}
