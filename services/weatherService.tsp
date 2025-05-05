import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "dt") long j2, @Json(name = "temp") double d2, @Json(name = "description") @NotNull String description, @Json(name = "icon") @NotNull String icon
model WeatherRemoteEntity {
    dt: int64;
    temp: float64;
    description: string;
    icon: string;
}

// @Json(name = "aqi") int i2, @Json(name = "api") @Nullable Integer num, @Json(name = "dt") long j2, @Json(name = "co") @Nullable Double d2, @Json(name = "no") @Nullable Double d3, @Json(name = "no2") @Nullable Double d4, @Json(name = "o3") @Nullable Double d5, @Json(name = "so2") @Nullable Double d6, @Json(name = "pm2_5") @Nullable Double d7, @Json(name = "pm10") @Nullable Double d8, @Json(name = "nh3") @Nullable Double d9
model AirQualityRemoteEntity {
    aqi: int32;
    api?: int32;
    dt: int64;
    co?: float64;
    no?: float64;
    no2?: float64;
    o3?: float64;
    so2?: float64;
    pm2_5?: float64;
    pm10?: float64;
    nh3?: float64;
}

// @Json(name = "weather") @Nullable List<WeatherRemoteEntity> list, @Json(name = "airQuality") @Nullable List<AirQualityRemoteEntity> list2
model WeatherForecastRemoteEntity {
    weather?: WeatherRemoteEntity[];
    airQuality?: AirQualityRemoteEntity[];
}

@tag("Weather")
@route("api")
interface WeatherService {
    @route("4.0/weather{?lat,long}")
    @get
    getWeatherForecast(
        @query lat: float64,
        @query long: float64,
    ): WeatherForecastRemoteEntity;
}
