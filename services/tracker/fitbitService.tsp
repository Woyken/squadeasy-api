import "@typespec/http";
using Http;

namespace SquadEasyFitbitApi;

model FitbitAuthRemoteEntity {
    access_token: string;
    refresh_token: string;
    expires_in: int32;
}

alias FitbitGrantType = "authorization_code";

// TODO, base url is this: https://api.fitbit.com
@tag("Fitbit")
interface FitbitService {
    @route("oauth2/token{?client_id,grant_type,redirect_uri,code}")
    @post
    getFitbitToken(
        @header(#{ name: "Authorization" }) authorization: string,
        @header(#{ name: "Content-Type" }) contentType: "application/x-www-form-urlencoded",
        @query client_id: string,
        @query grant_type: FitbitGrantType,
        @query redirect_uri: string,
        @query code: string,
    ): FitbitAuthRemoteEntity;
}
