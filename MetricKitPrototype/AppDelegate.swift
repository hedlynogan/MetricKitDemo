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
    print(firstPayload.dictionaryRepresentation())
  }
  
  func didReceive(_ payloads: [MXDiagnosticPayload]) {
    guard let firstPayload = payloads.first else { return }
    print(firstPayload.dictionaryRepresentation())
  }
}
