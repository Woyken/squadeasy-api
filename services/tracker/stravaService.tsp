import "@typespec/http";
using Http;

namespace SquadEasyStravaApi;

model StravaAthleteRemoteEntity {
    id: string;
}

model StravaAuthRemoteEntity {
    expires_at: int32;
    refresh_token: string;
    access_token: string;
    athlete: StravaAthleteRemoteEntity;
}

// TODO, base url is this: https://www.strava.com
@tag("Strava")
interface StravaService {
    @route("/api/v3/oauth/token{?client_id,client_secret,code,grant_type}")
    @post
    postTODO_api_v3_oauth_token(
        @query client_id: string,
        @query client_secret: string,
        @query code: string,
        @query grant_type: string,
    ): StravaAuthRemoteEntity;
}
