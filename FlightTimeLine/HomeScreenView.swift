//
//  HomeScreenView.swift
//  FlightTimeLine
//
//  Created by Nikita Chekan on 21.12.2022.
//

import SwiftUI

enum Route: Hashable {
    case arrivals
    case departures
    case timeline
}

struct HomeScreenView: View {
    
    private let flightInfo = FlightInformation.generateFlights()
    
    private var arrivals: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .arrival
        }
    }
    
    private var departures: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .departure
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                VStack(alignment: .leading) {
                    NavigationLink("Arrivals", value: Route.arrivals)
                    NavigationLink("Departures", value: Route.departures)
                    NavigationLink("Flight Timeline", value: Route.timeline)
                    
                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .arrivals:
                    FlightBoardView(boardName: "Arrivals", flightInfo: arrivals)
                case .departures:
                    FlightBoardView(boardName: "Departures", flightInfo: departures)
                case .timeline:
                    TimeLineView(flights: flightInfo)
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
