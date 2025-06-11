//
//  ConnectionManger.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import Foundation
import Network
class ConnectionManger: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    @Published var isConnected: Bool = true
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
