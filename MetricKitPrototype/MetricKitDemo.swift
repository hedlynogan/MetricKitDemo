//
//  ContentView.swift
//  MetricKitPrototype
//
//  Created by Ned Hogan on 12/6/21.
//

import SwiftUI
import MetricKit

struct MetricKitDemo: View {
  
  //let metricManager = MXMetricManager.shared
  //metricManager.add(<#T##MXMetricManagerSubscriber#>)
  //metricManager.add(self)
  
  var body: some View {
        Text("Hello, MetricKit!")
            .padding()
    }
}

struct StarkeyModelList_Previews: PreviewProvider {
    static var previews: some View {
        MetricKitDemo()
    }
}

extension MetricKitDemo: MXMetricManagerSubscriber {
  func didReceive(_ payloads: [MXMetricPayload]) {
    guard let firstPayload = payloads.first else { return }
    print(firstPayload.dictionaryRepresentation())
  }
  
  func didReceive(_ payloads: [MXDiagnosticPayload]) {
    guard let firstPayload = payloads.first else { return }
    print(firstPayload.dictionaryRepresentation())
  }
}
