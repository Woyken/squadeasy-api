import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "title") @NotNull String title, @Json(name = "description") @NotNull String description, @Json(name = "status") @NotNull String status, @Json(name = "hasGlobalMission") @Nullable Boolean bool
model ChallengeMarqueeRemoteEntity {
    title: string;
    description: string;
    status: string;
    hasGlobalMission: boolean;
}

// @Json(name = "lottie") @Nullable String str, @Json(name = "image") @Nullable String str2
model MissionSolidaryResourcesRemoteEntity {
    lottie?: string;
    image?: string;
}

// @Json(name = "success") @Nullable String str, @Json(name = "goal") double d2, @Json(name = "progress") @Nullable Double d3
model MissionSolidaryStepRemoteEntity {
    success?: string;
    goal: float64;
    progress?: float64;
}

// @Json(name = "image") @Nullable String str, @Json(name = "members") double d2, @Json(name = "progress") double d3, @Json(name = "percentage") double d4
model MissionSolidaryStatisticRemoteEntity {
    image?: string;
    members: float64;
    progress: float64;
    percentage: float64;
}

//@Json(name = "me") @NotNull MissionSolidaryStatisticRemoteEntity me2, @Json(name = "team") @Nullable MissionSolidaryStatisticRemoteEntity missionSolidaryStatisticRemoteEntity, @Json(name = "total") @NotNull MissionSolidaryStatisticRemoteEntity total
model MissionSolidaryStatisticsRemoteEntity {
    me: MissionSolidaryStatisticRemoteEntity;
    team?: MissionSolidaryStatisticRemoteEntity;
    total: MissionSolidaryStatisticRemoteEntity;
}

// @Json(name = "id") @NotNull String id, @Json(name = "title") @NotNull String title, @Json(name = "index") int i2, @Json(name = "description") @NotNull String description, @Json(name = "overDescription") @Nullable String str, @Json(name = "reward") int i3, @Json(name = "rewardUnit") @NotNull String rewardUnit, @Json(name = "resources") @NotNull MissionSolidaryResourcesRemoteEntity resources, @Json(name = "objective") double d2, @Json(name = "progress") double d3, @Json(name = "percentage") int i4, @Json(name = "type") @NotNull String type, @Json(name = "endAt") @NotNull String endAt, @Json(name = "steps") @Nullable List<MissionSolidaryStepRemoteEntity> list, @Json(name = "statistics") @Nullable MissionSolidaryStatisticsRemoteEntity missionSolidaryStatisticsRemoteEntity
model MissionSolidaryRemoteEntity {
    id: string;
    title: string;
    index: int32;
    description: string;
    overDescription?: string;
    reward: int32;
    rewardUnit: string;
    resources: MissionSolidaryResourcesRemoteEntity;
    objective: float64;
    progress: float64;
    percentage: int32;
    type: string;
    endAt: string;
    steps?: MissionSolidaryStepRemoteEntity[];
    statistics?: MissionSolidaryStatisticsRemoteEntity;
}

// @Json(name = "usersCount") int i2, @Json(name = "distanceSum") double d2, @Json(name = "answersCount") int i3, @Json(name = "stepCount") double d3
model ChallengeOverStatisticsRemoteEntity {
    usersCount: int32;
    distanceSum: float64;
    answersCount: int32;
    stepCount: float64;
}

// @Json(name = "image") @Nullable String str, @Json(name = "spaceImage") @Nullable String str2, @Json(name = "startAt") @Nullable String str3, @Json(name = "endAt") @Nullable String str4, @Json(name = "title") @Nullable String str5, @Json(name = "tagline") @Nullable String str6, @Json(name = "description") @Nullable String str7, @Json(name = "deletionDate") @Nullable String str8, @Json(name = "statistics") @Nullable ChallengeOverStatisticsRemoteEntity challengeOverStatisticsRemoteEntity
model ChallengeRemoteEntity {
    image?: string;
    spaceImage?: string;
    startAt?: string;
    endAt?: string;
    title?: string;
    tagline?: string;
    description?: string;
    deletionDate?: string;
    statistics?: ChallengeOverStatisticsRemoteEntity;
}

// @Json(name = "image") @Nullable String str, @Json(name = "publicImage") @Nullable String str2, @Json(name = "spaceImage") @Nullable String str3, @Json(name = "startAt") @NotNull String startAt, @Json(name = "endAt") @NotNull String endAt, @Json(name = "title") @NotNull String title, @Json(name = "description") @NotNull String description, @Json(name = "missions") @Nullable List<LegacyMissionSolidaryRemoteEntity> list
model LegacyChallengeRemoteEntity {
    image?: string;
    publicImage?: string;
    spaceImage?: string;
    startAt: string;
    endAt: string;
    title: string;
    description: string;
    missions?: MissionSolidaryRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "minimalRank") int i2, @Json(name = "image") @Nullable String str, @Json(name = "publicImage") @Nullable String str2, @Json(name = "defaultImage") @Nullable String str3, @Json(name = "color") @NotNull String color, @Json(name = "name") @NotNull String name, @Json(name = "description") @NotNull String description
model LegacyRankingMedalRemoteEntity {
    id: string;
    minimalRank: int32;
    image?: string;
    publicImage?: string;
    defaultImage?: string;
    color: string;
    name: string;
    description: string;
}

// @Json(name = "image") @Nullable String str, @Json(name = "publicImage") @Nullable String str2, @Json(name = "spaceImage") @Nullable String str3, @Json(name = "deletionDate") @NotNull String deletionDate, @Json(name = "title") @NotNull String title, @Json(name = "description") @NotNull String description, @Json(name = "missionSummaryDescription") @Nullable String str4, @Json(name = "missionSummaryUrl") @Nullable String str5, @Json(name = "missionsSucceededCount") @Nullable Integer num, @Json(name = "missions") @Nullable List<LegacyMissionSolidaryRemoteEntity> list, @Json(name = "statistics") @NotNull ChallengeOverStatisticsRemoteEntity statistics, @Json(name = "rank") @Nullable Integer num2, @Json(name = "medal") @Nullable LegacyRankingMedalRemoteEntity legacyRankingMedalRemoteEntity
model ChallengeOverRemoteEntity {
    image?: string;
    publicImage?: string;
    spaceImage?: string;
    deletionDate: string;
    title: string;
    description: string;
    missionSummaryDescription?: string;
    missionSummaryUrl?: string;
    missionsSucceededCount?: int32;
    missions?: MissionSolidaryRemoteEntity[];
    statistics: ChallengeOverStatisticsRemoteEntity;
    rank?: int32;
    medal?: LegacyRankingMedalRemoteEntity;
}

@tag("Challenge")
@route("api")
interface ChallengeService {
    @route("2.0/my/challenge/marquee")
    @get
    getMyChallengeMarquee(): ChallengeMarqueeRemoteEntity;

    @route("3.0/global-missions/over")
    @get
    getOverGlobalMissions(): MissionSolidaryRemoteEntity[];

    @route("3.0/my/challenge")
    @get
    getMyChallenge(): ChallengeRemoteEntity;

    @route("3.0/global-missions/active")
    @get
    getActiveGlobalMissions(): MissionSolidaryRemoteEntity[];

    @route("2.0/my/challenge")
    @get
    getLegacyMyChallenge(): LegacyChallengeRemoteEntity;

    @route("2.0/my/challenge/over")
    @get
    getLegacyMyChallengeOver(): ChallengeOverRemoteEntity;
}
