import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "type") @NotNull String type, @Json(name = "value") double d2, @Json(name = "source") @Nullable String str
model CO2ReferencesRemoteEntity {
    type: string;
    value: float64;
    source?: string;
}

// @Json(name = "value") double d2, @Json(name = "SIType") @NotNull String SIType
model Co2DetailSavedRemoteEntity {
    value: float64;
    SIType: string;
}

// @Json(name = "value") double d2, @Json(name = "title") @NotNull String title, @Json(name = "icon") @NotNull String icon
model CO2EquivalenceRemoteEntity {
    value: float64;
    title: string;
    icon: string;
}

// @Json(name = "totalSaved") @NotNull Co2DetailSavedRemoteEntity totalSaved, @Json(name = "equivalences") @Nullable List<CO2EquivalenceRemoteEntity> list
model CO2kpiRemoteEntity {
    totalSaved: Co2DetailSavedRemoteEntity;
    equivalences: CO2EquivalenceRemoteEntity[];
}

// @Json(name = "icon") @Nullable String str, @Json(name = "reference") @NotNull CO2ReferencesRemoteEntity reference, @Json(name = "user") @NotNull CO2kpiRemoteEntity user, @Json(name = "team") @NotNull CO2kpiRemoteEntity team, @Json(name = "challenge") @Nullable CO2kpiRemoteEntity cO2kpiRemoteEntity
model CO2DetailsRemoteEntity {
    icon?: string;
    reference: CO2ReferencesRemoteEntity;
    user: CO2kpiRemoteEntity;
    team: CO2kpiRemoteEntity;
    challenge?: CO2kpiRemoteEntity;
}

@tag("CO2")
@route("api")
interface CO2Service {
    @route("4.0/co2/summary")
    @get
    getTODO4_0_co2_summary(): CO2DetailsRemoteEntity;
}
