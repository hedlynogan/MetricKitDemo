//
//  AppDelegate.swift
//  MetricKitPrototype
//
//  Created by Ned Hogan on 12/6/21.
//

//import Foundation
import SwiftUI
import MetricKit


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Starting MetricKit")
    let metricManager = MXMetricManager.shared
    metricManager.add(self)
    return true
  }
}

extension AppDelegate: MXMetricManagerSubscriber {
  func didReceive(_ payloads: [MXMetricPayload]) {
    guard let firstPayload = payloads.first else { return }
    print("MXMeterixPayload Recieve")
    print(firstPayload.dictionaryRepresentation())
    os_log("Received Daily MXDiagnosticPayload:", type: .debug)
    for diagnosticPayload in payloads {
      if let diagnosticPayloadJsonString = String(data: diagnosticPayload.jsonRepresentation(), encoding: .utf8) {
        
        os_log("%@", type: .debug, diagnosticPayloadJsonString)
        print("OS Log Payload: \(diagnosticPayloadJsonString)")
        
        // Here you could upload these metrics (in JSON form) to your servers to aggregate app performance metrics
      }
      
    }
    
    func didReceive(_ payloads: [MXDiagnosticPayload]) {
      print("MXDiagnosticPayload Recieve")
      guard let firstPayload = payloads.first else { return }
      print(firstPayload.dictionaryRepresentation())
    }
  }
}
