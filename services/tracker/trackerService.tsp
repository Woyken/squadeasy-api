import "@typespec/http";
using Http;

namespace SquadEasyApi;

alias TrackerTypeValue = "strava" | "google fit" | "garmin" | "fitbit" | "unknown";

model TrackerRemoteEntity {
    tracker: TrackerTypeValue;
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

alias StravaIntegrationId = "strava";
alias GarminIntegrationId = "garmin";
alias FitbitIntegrationId = "fitbit";

@tag("Tracker")
@route("api")
interface TrackerService {
    @route("2.0/my/integrations/{id}")
    @delete
    deleteIntegration(@path id: string): void;

    @route("2.0/my/integrations")
    @get
    getIntegrations(): TrackerRemoteEntity[];

    @sharedRoute
    @route("2.0/my/integrations/{id}")
    @post
    connectGarmin(
        @path id: GarminIntegrationId,
        @body trackerGarminLoginBodyRemoteEntity: TrackerGarminLoginBodyRemoteEntity,
    ): void;

    @sharedRoute
    @route("2.0/my/integrations/{id}")
    @post
    connectStrava(
        @path id: StravaIntegrationId,
        @body trackerLoginBodyRemoteEntity: TrackerLoginBodyRemoteEntity,
    ): void;

    @sharedRoute
    @route("2.0/my/integrations/{id}")
    @post
    connectFitbit(
        @path id: FitbitIntegrationId,
        @body fitbitLoginBodyRemoteEntity: FitbitLoginBodyRemoteEntity,
    ): void;
}
