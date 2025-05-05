import "@typespec/http";
using Http;

namespace SquadEasyFitbitApi;

model FitbitAuthRemoteEntity {
    access_token: string;
    refresh_token: string;
    expires_in: int32;
}

// TODO, base url is this: https://api.fitbit.com
@tag("Fitbit")
@route("api")
interface FitbitService {
    @route("oauth2/token{?client_id,grant_type,redirect_uri,code}")
    @post
    getFitbitToken(
        @header(#{ name: "Authorization" }) authorization: string,
        @header(#{ name: "Content-Type" }) contentType: string,
        @query client_id: string,
        @query grant_type: string,
        @query redirect_uri: string,
        @query code: string,
    ): FitbitAuthRemoteEntity;
}
