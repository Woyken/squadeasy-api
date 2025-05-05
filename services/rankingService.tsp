import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "id") @NotNull String id, @Json(name = "number") int i2, @Json(name = "name") @Nullable String str, @Json(name = "startDate") @NotNull String startDate, @Json(name = "endDate") @NotNull String endDate, @Json(name = "offSeason") @Nullable Boolean bool
model RankingSeasonAvailableRemoteEntity {
    id: string;
    number: int32;
    name?: string;
    startDate: string;
    endDate: string;
    offSeason?: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "image") @Nullable String str, @Json(name = "name") @NotNull String name, @Json(name = "points") @Nullable Double d2, @Json(name = "rank") int i2, @Json(name = "medals") @Nullable List<RankingMedalRemoteEntity> list, @Json(name = "isUser") boolean z
model RankingElementRemoteEntity {
    id: string;
    image?: string;
    name: string;
    points?: float64;
    rank: int32;
    medals?: RankingMedalRemoteEntity[];
    isUser: boolean;
}

// @Json(name = "name") @NotNull String name, @Json(name = "image") @Nullable String str, @Json(name = "count") int i2
model RankingMedalRemoteEntity {
    name: string;
    image?: string;
    count: int32;
}

// @Json(name = "id") @NotNull String id, @Json(name = "image") @Nullable String str, @Json(name = "name") @NotNull String name, @Json(name = "isUser") boolean z, @Json(name = "rank") int i2, @Json(name = "pointsDiff") @Nullable Double d2
model RankingPelotonScaleTeamRemoteEntity {
    id: string;
    image?: string;
    name: string;
    isUser: boolean;
    rank: int32;
    pointsDiff?: float64;
}

// @Json(name = "last") @NotNull RankingPelotonScaleTeamRemoteEntity last, @Json(name = "middle") @NotNull RankingPelotonScaleTeamRemoteEntity middle, @Json(name = "first") @NotNull RankingPelotonScaleTeamRemoteEntity first
model RankingPelotonScaleRemoteEntity {
    last: RankingPelotonScaleTeamRemoteEntity;
    middle: RankingPelotonScaleTeamRemoteEntity;
    first: RankingPelotonScaleTeamRemoteEntity;
}

// @Json(name = "rank") int i2, @Json(name = "points") @Nullable Double d2, @Json(name = "medals") @Nullable List<RankingMedalRemoteEntity> list, @Json(name = "scale") @NotNull RankingPelotonScaleRemoteEntity scale
model RankingPelotonRemoteEntity {
    rank: int32;
    points?: float64;
    medals?: RankingMedalRemoteEntity[];
    scale: RankingPelotonScaleRemoteEntity;
}

// @Json(name = "seasonAvailable") @Nullable List<RankingSeasonAvailableRemoteEntity> list, @Json(name = "season") @Nullable RankingSeasonAvailableRemoteEntity rankingSeasonAvailableRemoteEntity, @Json(name = "isRanked") boolean z, @Json(name = "rankedElements") int i2, @Json(name = "elements") @Nullable List<RankingElementRemoteEntity> list2, @Json(name = "peloton") @Nullable RankingPelotonRemoteEntity rankingPelotonRemoteEntity
model RankingRemoteEntity {
    seasonAvailable?: RankingSeasonAvailableRemoteEntity[];
    season?: RankingSeasonAvailableRemoteEntity;
    isRanked: boolean;
    rankedElements: int32;
    elements?: RankingElementRemoteEntity[];
    peloton?: RankingPelotonRemoteEntity;
}

@tag("Ranking")
@route("api")
interface RankingService {
    @route("3.0/ranking/{type}/{seasonId}")
    @get
    getRanking(@path type: string, @path seasonId: string): RankingRemoteEntity;

    @route("3.0/ranking/{type}/{seasonId}/elements{?direction,offsetId}")
    @get
    getRankingElements(
        @path type: string,
        @path seasonId: string,
        @query direction: string,
        @query offsetId: string,
    ): RankingElementRemoteEntity[];

    @route("3.0/ranking/{type}/{seasonId}/elements/me")
    @get
    getMyRankingElement(
        @path type: string,
        @path seasonId: string,
    ): RankingElementRemoteEntity;

    @route("3.0/ranking/{type}/{seasonId}/elements/search{?name,limit,offsetId}")
    @get
    searchRankingElements(
        @path type: string,
        @path seasonId: string,
        @query name: string,
        @query limit: int32,
        @query offsetId: string,
    ): RankingElementRemoteEntity[];
}
