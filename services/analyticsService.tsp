import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "type") @NotNull String type, @Json(name = "value") @NotNull String value
model AnalyticsRemoteEntity {
    type: string;
    value: string;
}

@tag("Analytics")
@route("api")
interface AnalyticsService {
    @route("2.0/event")
    @post
    postTODO2_0_event(@body analyticsRemoteEntity: AnalyticsRemoteEntity): void;
}
