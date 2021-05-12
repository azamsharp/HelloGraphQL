//
//  CountryDetailView.swift
//  HelloGraphQL
//
//  Created by Mohammad Azam on 5/12/21.
//

import SwiftUI

struct CountryDetailView: View {
    
    let country: GetAllCountriesQuery.Data.Country
    @State private var countryInfo: GetCountryInfoQuery.Data.Country?
    
    var body: some View {
        VStack {
            Text(countryInfo?.name ?? "")
            Text(countryInfo?.capital ?? "")
            List(countryInfo?.states ?? [], id: \.name) { state in
                Text(state.name)
            }
        }.onAppear(perform: {
            Network.shared.apollo.fetch(query: GetCountryInfoQuery(code: country.code)) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        self.countryInfo = graphQLResult.data?.country
                    }
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: GetAllCountriesQuery.Data.Country(code: "US", name: "USA", emoji: ""))
    }
}
