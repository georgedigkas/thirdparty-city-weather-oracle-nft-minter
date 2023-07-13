// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module thridparty_city_weather_oracle_nft_minter::nft_minter {
    use std::string::String;

    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    use oracle::weather::CityWeatherOracle;

    struct ThirdPartyNFT has key, store {
        id: UID,
        geoname_id: u32,
        name: String,
        country: String,
        weather_id: u16,
        temp: u32
    }

    public fun mint(
        city_weather_oracle: &CityWeatherOracle, 
        ctx: &mut TxContext
    ): ThirdPartyNFT {
        ThirdPartyNFT {
            id: object::new(ctx),
            geoname_id: oracle::weather::geoname_id(city_weather_oracle),
            name: oracle::weather::name(city_weather_oracle),
            country: oracle::weather::country(city_weather_oracle),
            weather_id: oracle::weather::weather_id(city_weather_oracle),
            temp: oracle::weather::temp(city_weather_oracle)
        }
    }
}
