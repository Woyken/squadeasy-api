import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "id") @NotNull String id, @Json(name = "name") @Nullable String str, @Json(name = "teamName") @Nullable String str2, @Json(name = "code") @Nullable String str3, @Json(name = "isPrivate") boolean z, @Json(name = "image") @Nullable String str4, @Json(name = "publicImage") @Nullable String str5, @Json(name = "users") @Nullable List<UserRemoteEntity> list, @Json(name = "captainId") @Nullable String str6, @Json(name = "rank") @Nullable Integer num, @Json(name = "totalPoints") int i2, @Json(name = "boostAvailableAt") @Nullable String str7
model TeamRemoteEntity {
    id: string;
    name?: string;
    teamName?: string;
    code?: string;
    isPrivate: boolean;
    image?: string;
    publicImage?: string;
    users?: UserRemoteEntity[];
    captainId?: string;
    rank?: int32;
    totalPoints: int32;
    boostAvailableAt?: string;
}

// @Json(name = "spaceId") @Nullable String str, @Json(name = "searchText") @Nullable String str2, @Json(name = "limit") @Nullable Integer num, @Json(name = "offset") @Nullable Integer num2, @Json(name = "orderBy") @NotNull String orderBy, @Json(name = "orderDirection") @NotNull String orderDirection
model TeamSearchBodyRemoteEntity {
    spaceId?: string;
    searchText?: string;
    limit?: int32;
    offset?: int32;
    orderBy: string;
    orderDirection: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @Nullable String str, @Json(name = "teamName") @Nullable String str2, @Json(name = "isPrivate") boolean z, @Json(name = "image") @Nullable String str3, @Json(name = "publicImage") @Nullable String str4, @Json(name = "usersFirstNames") @Nullable List<String> list, @Json(name = "nbMembers") @Nullable Integer num
model TeamSearchRemoteEntity {
    id: string;
    name?: string;
    teamName?: string;
    isPrivate: boolean;
    image?: string;
    publicImage?: string;
    usersFirstNames?: string[];
    nbMembers?: int32;
}

// @Json(name = "activityId") @NotNull String id, @Json(name = "type") @NotNull String type, @Json(name = "points") int i2, @Json(name = "value") int i3, @Json(name = "title") @NotNull String title
model TeamActivityStatsRemoteEntity {
    activityId: string;
    type: string;
    points: int32;
    value: int32;
    title: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "globalRank") @Nullable Double d2, @Json(name = "seasonRank") @Nullable Double d3
model TeamDetailsRemoteEntity {
    id: string;
    globalRank?: float64;
    seasonRank?: float64;
}

// @Json(name = "id") @NotNull String id, @Json(name = "image") @Nullable String str, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName, @Json(name = "points") @Nullable Double d2, @Json(name = "isCaptain") boolean z
model TeamManagementUserRemoteEntity {
    id: string;
    image?: string;
    firstName: string;
    lastName: string;
    points?: float64;
    isCaptain: boolean;
}

// @Json(name = "canEditName") boolean z, @Json(name = "canEditImage") boolean z2, @Json(name = "canEditPassword") boolean z3, @Json(name = "canKick") boolean z4, @Json(name = "canPromote") boolean z5
model TeamManagementPoliciesRemoteEntity {
    canEditName: boolean;
    canEditImage: boolean;
    canEditPassword: boolean;
    canKick: boolean;
    canPromote: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "image") @Nullable String str, @Json(name = "name") @NotNull String name, @Json(name = "code") @NotNull String code, @Json(name = "users") @Nullable List<TeamManagementUserRemoteEntity> list, @NotNull TeamManagementPoliciesRemoteEntity policies
model TeamManagementRemoteEntity {
    id: string;
    image?: string;
    name: string;
    code: string;
    users?: TeamManagementUserRemoteEntity[];
    policies: TeamManagementPoliciesRemoteEntity;
}

// (@Json(name = "code") @Nullable String str
model JoinTeamRemote {
    code: string;
}

// @Json(name = "name") @NotNull String name, @Json(name = "code") @NotNull String code
model EditTeamRemoteEntity {
    name: string;
    code: string;
}

// @Json(name = "name") @NotNull String name, @Json(name = "code") @NotNull String code
model CreateTeamRemote {
    name: string;
    code: string;
}

@tag("Team")
@route("api")
interface TeamService {
    @route("2.0/my/team/image")
    @post
    postTODO2_0_my_team_image(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            part: HttpPart<unknown>;
        },
    ): void;

    @route("2.0/teams/{id}")
    @get
    getTODO2_0_teams__id_(@path id: string): TeamRemoteEntity;

    @route("2.0/teams/search")
    @post
    postTODO2_0_teams_search(
        @body teamSearchBodyRemoteEntity: TeamSearchBodyRemoteEntity,
    ): TeamSearchRemoteEntity[];

    @route("2.0/my/team/statistics")
    @get
    getTODO2_0_my_team_statistics(): TeamActivityStatsRemoteEntity[];

    @route("2.0/my/team/kick")
    @post
    postTODO2_0_my_team_kick(@body idRemoteEntity: IdRemoteEntity): void;

    @route("3.0/team-detail/{id}")
    @get
    getTODO3_0_team_detail__id_(@path id: string): TeamDetailsRemoteEntity;

    @route("2.0/teams")
    @get
    getTODO2_0_teams(): TeamSearchRemoteEntity[];

    @route("3.0/teams/management")
    @get
    getTODO3_0_teams_management(): TeamManagementRemoteEntity;

    @route("2.0/my/team/captain")
    @patch
    patchTODO2_0_my_team_captain(@body idRemoteEntity: IdRemoteEntity): void;

    @route("2.0/teams/{id}/join")
    @post
    postTODO2_0_teams__id__join(
        @path id: string,
        @body joinTeamRemote: JoinTeamRemote,
    ): void;

    @route("2.0/my/team")
    @patch
    patchTODO2_0_my_team(
        @body editTeamRemoteEntity: EditTeamRemoteEntity,
    ): void;

    @route("2.0/teams")
    @post
    postTODO2_0_teams(@body createTeamRemote: CreateTeamRemote): void;

    @route("2.0/my/team")
    @get
    getTODO2_0_my_team(): TeamRemoteEntity;

    @route("2.0/my/team/leave")
    @post
    postTODO2_0_my_team_leave(): void;
}
