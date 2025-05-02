import "@typespec/http";
using Http;

namespace SquadEasyApi;

model TrackerRemoteEntity {
    tracker: string;
    isActive: boolean;
    trackerSecret?: string;
    trackerId?: string;
    trackerUri?: string;
    image?: string;
    notes?: string;
}

model TrackerGarminLoginBodyRemoteEntity {
    accessToken: string;
    secret: string;
}

model TrackerLoginBodyRemoteEntity {
    id: string;
    accessToken: string;
    refreshToken: string;
    expiresAt: int32;
}

model FitbitLoginBodyRemoteEntity {
    accessToken: string;
    refreshToken: string;
    expiresIn: int32;
}

@tag("Strava")
@route("api")
interface StravaService {
    @route("2.0/my/integrations/{id}")
    @delete
    deleteTODO2_0_my_integrations__id_(@path id: string): void;

    @route("2.0/my/integrations")
    @get
    getTODO2_0_my_integrations(): TrackerRemoteEntity[];

    @route("2.0/my/integrations/garmin")
    @post
    postTODO2_0_my_integrations_garmin(
        @path id: string,

        @body
        trackerGarminLoginBodyRemoteEntity: TrackerGarminLoginBodyRemoteEntity,
    ): void;

    @route("2.0/my/integrations/{id}")
    @post
    postTODO2_0_my_integrations__id_(
        @path id: string,
        @body trackerLoginBodyRemoteEntity: TrackerLoginBodyRemoteEntity,
    ): void;

    @route("2.0/my/integrations/fitbit")
    @post
    postTODO2_0_my_integrations_fitbit(
        @body fitbitLoginBodyRemoteEntity: FitbitLoginBodyRemoteEntity,
    ): void;
}
