//
//  FlightDetailsView.swift
//  FlightTimeLine
//
//  Created by Nikita Chekan on 21.12.2022.
//

import SwiftUI

struct FlightDetailsView: View {
    let flight: FlightInformation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(flight.airline) \(flight.number)")
                    .font(.largeTitle)
                Spacer()
            }
            Text("\(flight.direction == .arrival ? "From:" : "To:") \(flight.otherAirport)")
            Text(flight.flightStatus)
                .foregroundColor(Color(flight.timelineColor))
            Spacer()
        }
        .navigationTitle("Flight Details")
        .font(.headline)
        .padding()
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsView(flight: FlightInformation.generateFlight())
    }
}
