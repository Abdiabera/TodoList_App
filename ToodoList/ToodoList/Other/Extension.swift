//
//  Extension.swift
//  ToodoList
//
//  Created by Abdi Abera on 3/28/25.
//

import Foundation
extension Encodable {
    func asDictionary () -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            //return jason or empty
            return json ?? [:]
        }
        catch {
            return [:]
        }
    }
}
