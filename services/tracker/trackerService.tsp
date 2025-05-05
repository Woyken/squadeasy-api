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
    deleteIntegration(@path id: string): void;

    @route("2.0/my/integrations")
    @get
    getIntegrations(): TrackerRemoteEntity[];

    @route("2.0/my/integrations/garmin")
    @post
    connectGarmin(
        @path id: string,

        @body
        trackerGarminLoginBodyRemoteEntity: TrackerGarminLoginBodyRemoteEntity,
    ): void;

    @route("2.0/my/integrations/{id}")
    @post
    connectIntegration(
        @path id: string,
        @body trackerLoginBodyRemoteEntity: TrackerLoginBodyRemoteEntity,
    ): void;

    @route("2.0/my/integrations/fitbit")
    @post
    connectFitbit(
        @body fitbitLoginBodyRemoteEntity: FitbitLoginBodyRemoteEntity,
    ): void;
}
