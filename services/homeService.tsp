import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "commands") @Nullable List<CommandRemoteEntity> list, @Json(name = "retryAt") @Nullable String str
model HomeUserActivityGroupStatusRemoteEntity {
    commands?: CommandRemoteEntity[];
    retryAt: string;
}
// @Json(name = "id") @NotNull String id, @Json(name = "activityIcon") @NotNull String activityIcon, @Json(name = "activityName") @NotNull String activityName, @Json(name = "command") @Nullable CommandRemoteEntity commandRemoteEntity, @Json(name = "date") @Nullable String str, @Json(name = "points") int i2, @Json(name = "goal") double d2, @Json(name = "unit") @NotNull String unit, @Json(name = "isTeam") boolean z, @Json(name = "progress") double d3, @Json(name = "percentage") double d4, @Json(name = "isOver") boolean z2, @Json(name = "isSuccess") boolean z3, @Json(name = "isOneShot") boolean z4
model MissionRemoteEntity {
    id: string;
    activityIcon: string;
    activityName: string;
    command?: CommandRemoteEntity;
    date?: string;
    points: int32;
    goal: float64;
    unit: string;
    isTeam: boolean;
    progress: float64;
    percentage: float64;
    isOver: boolean;
    isSuccess: boolean;
    isOneShot: boolean;
}

// @Json(name = "boosts") @Nullable List<String> list, @Json(name = "percentage") int i2, @Json(name = "maximumBoost") int i3
model HomeBoostRemoteEntity {
    boosts?: string[];
    percentage: int32;
    maximumBoost: int32;
}

// @Json(name = "social") @Nullable Integer num
model BadgesRemoteEntity {
    social?: int32;
}

// @Json(name = "iconName") @Nullable String str, @Json(name = "iconUrl") @Nullable String str2, @Json(name = "title") @Nullable String str3, @Json(name = "badgeValue") @Nullable Integer num, @Json(name = "command") @Nullable CommandRemoteEntity commandRemoteEntity
model ItemRemoteEntity {
    iconName?: string;
    iconUrl?: string;
    title?: string;
    badgeValue?: int32;
    command?: CommandRemoteEntity;
}

// @Json(name = "title") @NotNull String title, @Json(name = "leftItems") @Nullable List<ItemRemoteEntity> list, @Json(name = "rightItems") @Nullable List<ItemRemoteEntity> list2
model HeadRemoteEntity {
    title: string;
    leftItems?: ItemRemoteEntity[];
    rightItems?: ItemRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "type") @NotNull String type, @Json(name = "title") @Nullable String str, @Json(name = "titleArgs") @Nullable List<String> list, @Json(name = "subtitle") @Nullable String str2, @Json(name = "subtitleArgs") @Nullable List<String> list2, @Json(name = "description") @Nullable String str3, @Json(name = "descriptionArgs") @Nullable List<String> list3, @Json(name = "iconUrls") @Nullable List<String> list4, @Json(name = "overImageText") @Nullable String str4, @Json(name = "command") @Nullable CommandRemoteEntity commandRemoteEntity
model RowRemoteEntity {
    id: string;
    type: string;
    title?: string;
    titleArgs?: string[];
    subtitle?: string;
    subtitleArgs?: string[];
    description?: string;
    descriptionArgs?: string[];
    iconUrls?: string[];
    overImageText?: string;
    command?: CommandRemoteEntity;
}

// @Json(name = "id") @NotNull String id, @Json(name = "title") @Nullable String str, @Json(name = "titleArgs") @Nullable List<String> list, @Json(name = "presentationStyle") @NotNull String presentationStyle, @Json(name = "rows") @Nullable List<RowRemoteEntity> list2
model BodyRemoteEntity {
    id: string;
    title?: string;
    titleArgs?: string[];
    presentationStyle: string;
    rows?: RowRemoteEntity[];
}

// @Json(name = "head") @NotNull HeadRemoteEntity head, @Json(name = "body") @Nullable List<BodyRemoteEntity> list
model HomeResponseRemoteEntity {
    head: HeadRemoteEntity;
    body?: BodyRemoteEntity[];
}

// @Json(name = "type") @NotNull String type, @Json(name = "id") @Nullable String str, @Json(name = "title") @Nullable String str2, @Json(name = "subtitle") @Nullable String str3, @Json(name = "description") @Nullable String str4, @Json(name = "image") @Nullable String str5, @Json(name = "overImageText") @Nullable String str6, @Json(name = "ordinalNumber") @Nullable Integer num
model HomeCarouselRemoteEntity {
    type: string;
    id?: string;
    title?: string;
    subtitle?: string;
    description?: string;
    image?: string;
    overImageText?: string;
    ordinalNumber?: int32;
}

// @Json(name = "count") int i2, @Json(name = "images") @Nullable List<String> list
model HomeModeMissionRemoteEntity {
    count: int32;
    images?: string[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "image") @Nullable String str, @Json(name = "title") @NotNull String title, @Json(name = "subtitle") @NotNull String subtitle, @Json(name = "missions") @Nullable HomeModeMissionRemoteEntity homeModeMissionRemoteEntity, @Json(name = "popupDescription") @NotNull String popupDescription
model HomeModeRemoteEntity {
    id: string;
    image?: string;
    title: string;
    subtitle: string;
    missions?: HomeModeMissionRemoteEntity;
    popupDescription: string;
}

// @Json(name = "value") int i2, @Json(name = "updatedAt") @NotNull String updatedAt
model HomeStepsRemoteEntity {
    value: int32;
    updatedAt: string;
}

// @Json(name = "challengeTitle") @Nullable String str, @Json(name = "globalMissionProgress") @Nullable Integer num, @Json(name = "carousels") @Nullable List<HomeCarouselRemoteEntity> list, @Json(name = "steps") @Nullable HomeStepsRemoteEntity homeStepsRemoteEntity, @Json(name = "modes") @Nullable List<HomeModeRemoteEntity> list2, @Json(name = "modeBackgroundIcon") @Nullable String str2, @Json(name = "helpText") @Nullable String str3
model HomeRemoteEntity {
    challengeTitle?: string;
    globalMissionProgress?: int32;
    carousels?: HomeCarouselRemoteEntity[];
    steps?: HomeStepsRemoteEntity;
    modes?: HomeModeRemoteEntity[];
    modeBackgroundIcon?: string;
    helpText?: string;
}

// @Json(name = "id") @NotNull String id
model IdRemoteEntity {
    id: string;
}

// @NotNull String id, @NotNull String option, @Nullable String str
model SurveyOptionsRemoteEntity {
    id: string;
    option: string;
    str?: string;
}

// @NotNull String id, @Nullable String str, @NotNull String description, @Nullable List<SurveyOptionsRemoteEntity> list
model SurveyRemoteEntity {
    id: string;
    str?: string;
    description: string;
    list?: SurveyOptionsRemoteEntity[];
}

@tag("Home")
@route("api")
interface HomeService {
    @route("4.0/histories/activity-gps/last-activity-command{?sinceDate}")
    @get
    getLastActivityCommand(
        @query sinceDate: string,
    ): HomeUserActivityGroupStatusRemoteEntity;

    @route("3.0/missions/activities/over")
    @get
    getOverMissions(): MissionRemoteEntity[];

    @route("3.0/missions/activities/upcoming")
    @get
    getUpcomingMissions(): MissionRemoteEntity[];

    @route("3.0/boosts/received")
    @get
    getReceivedBoosts(): HomeBoostRemoteEntity;

    @route("3.0/badges{?social}")
    @get
    getBadges(@query social: string): BadgesRemoteEntity;

    @route("4.0/home")
    @get
    getHome(): HomeResponseRemoteEntity;

    @route("3.0/my/home")
    @get
    getMyHome(): HomeRemoteEntity;

    @route("3.0/missions/activities/ongoing")
    @get
    getOngoingMissions(): MissionRemoteEntity[];

    @route("3.0/survey/{id}/answer")
    @post
    answerSurvey(@path id: string, @body idRemoteEntity: IdRemoteEntity): void;

    @route("3.0/survey/{id}")
    @get
    getSurvey(@path id: string): SurveyRemoteEntity;
}
