//
//  UserHoldingsView.swift
//  StockList
//
//  Created by Maruf Memon on 06/03/24.
//

import SwiftUI

struct UserPortfolioView: View {
    @EnvironmentObject var um: UserHoldingsViewModel
    @State private var isExpanded = false
    
    @ViewBuilder
    var discloseBtn: some View {
        Button {
            withAnimation {
                isExpanded.toggle()
            }
        } label: {
            Image(systemName: "triangle.fill")
                .renderingMode(.template)
                .foregroundColor(.purple)
                .frame(width: 8)
                .rotationEffect(.degrees(isExpanded ? 0 : 180))
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    var expandableView: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Current Value:")
                    .bold()
                Spacer()
                Text("₹ \(um.portfolio!.currentValue, specifier: "%.2f")")
            }
            HStack {
                Text("Total Investment:")
                    .bold()
                Spacer()
                Text("₹ \(um.portfolio!.totalInvestment, specifier: "%.2f")")
            }
            HStack {
                Text("Today's Profit & Loss:")
                    .bold()
                Spacer()
                Text("₹ \(um.portfolio!.todayPNL, specifier: "%.2f")")
            }
        }
        .padding(.bottom, 20)
        .frame(height: isExpanded ? nil : 0, alignment: .top)
        .clipped()
    }
    
    @ViewBuilder
    var fixedView: some View {
        HStack {
            Text("Profit & Loss:")
                .bold()
            Spacer()
            Text("₹ \(um.portfolio!.currentPNL, specifier: "%.2f")")
        }
    }
    
    var body: some View {
        VStack {
            discloseBtn
            expandableView
            fixedView
        }
        .padding(.horizontal, 20)
    }
}

struct UserHoldingsView: View {
    @StateObject var um = UserHoldingsViewModel()
    
    @ViewBuilder
    private func holdingCell(for userHolding: UserHolding) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text(userHolding.symbol.uppercased())
                    .bold()
                Spacer()
                Text("LTP: **₹ \(userHolding.ltp, specifier: "%.2f")**")
            }
            HStack {
                Text("\(userHolding.quantity)")
                Spacer()
                Text("P/L: **₹ \(userHolding.pandl, specifier: "%.2f")**")
            }
        }
    }
    
    @ViewBuilder
    var holdingListView: some View {
        List(um.portfolio!.userHolding) { userHolding in
            holdingCell(for: userHolding)
        }
        .background(Color.secondary)
        .listStyle(.plain)
    }
    
    var body: some View {
        if(um.viewState == .loading) {
            ProgressView()
        } else if (um.viewState == .loaded && um.portfolio != nil) {
            holdingListView
            UserPortfolioView()
                .environmentObject(um)
        }
    }
}

#Preview {
    UserHoldingsView()
}
