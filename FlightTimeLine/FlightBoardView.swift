//
//  FlightBoardView.swift
//  FlightTimeLine
//
//  Created by Nikita Chekan on 21.12.2022.
//

import SwiftUI

struct FlightBoardView: View {
    @State private var isCancelled = false
    
    let boardName: String
    let flightInfo: [FlightInformation]
    
    private var shownFlights: [FlightInformation] {
        isCancelled
        ? flightInfo.filter { $0.status != .cancelled }
        : flightInfo
    }
    
    var body: some View {
        List(shownFlights) { flight in
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Toggle("Hide Cancelled", isOn: $isCancelled)
            }
        }
    }
}

struct FlightBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightBoardView(boardName: "Arrival", flightInfo: FlightInformation.generateFlights())
    }
}
