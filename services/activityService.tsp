import "@typespec/http";
using Http;

namespace SquadEasyApi;

alias ActivityTypeValue = "activitygroup" | "gps" | "walk" | "mission" | "quiz" | "bonus" | "media" | "socialtag" | "declared" | "unknown";

alias LegacyMissionType = "SOLO" | "TEAM" | "ACTIVITY_MISSION" | "SOCIAL_MISSION" | "MOBILITY_MISSION";

alias ActivityHistoryStatusValue = "ok" | "cheated" | "pending" | "rejected" | "unknown";

model QuizSummaryRemoteEntity {
    id: string;
    command?: CommandRemoteEntity;
    image?: string;
    title: string;
    points: int32;
    date: string;
    isAnswered: boolean;
    isSuccess: boolean;
}

model ActivityMissionHistoryRemoteEntity {
    id: string;
    type: ActivityTypeValue;
    name: string;
    date: string;
    points: int32;
    isOneShot: boolean;
    goalProgress: int32;
    isDuration: boolean;
    goal: int32;
    isSucceeded: boolean;
}

model SportSessionSummarySegmentRemoteEntity {
    activityId: string;
    name: string;
    duration: float64;
    distance: float64;
    polyline?: string;
    elevation: float64;
    speed?: float64;
    cheat?: boolean;
    startDate: string;
    endDate: string;
    totalPoints: int32;
    co2Saved?: float64;
    co2Used?: float64;
}

model SportGpsLocationRemoteEntity {
    latitude: float64;
    longitude: float64;
    elevation: float64;
    time: string;
}

model ActivityGpsDetailsRemoteEntity {
    type: string;
    points: int32;
    distance: int32;
    duration: int32;
    elevation: float64;
    speed: float64;
    gpsTrace?: SportGpsLocationRemoteEntity[];
    polyline?: string;
    isMobility?: boolean;
    co2?: float64;
    isSharable?: boolean;
}

model ActivityHomeQuizRemoteEntity {
    id: string;
    image?: string;
    publicImage?: string;
    question: string;
    points: int32;
    remainingTime?: int32;
    isAnswered: boolean;
    correctAnswer: boolean;
}

model ActivitiesHistoryFiltersRemoteEntity {
    filterBy: string;
    sinceDate: string;
    minDatePossible?: string;
    maxDatePossible?: string;
}

model ActivitiesHistoryHighlightRemoteEntity {
    name: string;
    value: float64;
    SIType: string;
}

model LegacyActivityHistoryRemoteEntity {
    id: string;
    name?: string;
    icon?: string;
    date: string;
    duration: int32;
    distance: float64;
    points: int32;
    status: ActivityHistoryStatusValue;
    command?: CommandRemoteEntity;
}

model ActivitiesHistoryRemoteEntity {
    filters: ActivitiesHistoryFiltersRemoteEntity;
    highlights?: ActivitiesHistoryHighlightRemoteEntity[];
    activities?: LegacyActivityHistoryRemoteEntity[];
}

model ActivityGpsBodyRemoteEntity {
    isMobility: boolean;
    isSharable: boolean;
}

model ActivityGpsHistoryRemoteEntity {
    id: string;
    type: string;
    date: string;
    value: int32;
    points: int32;
}

model ActivityDeclaredHistoryRemoteEntity {
    id: string;
    type: string;
    date: string;
    value: string;
    points: int32;
    activityName: string;
}

model ActivityCategoryRemoteEntity {
    id: string;
    name: string;
    iconUrl?: string;
    defaultOrder: int32;
    activityIds?: string[];
}

model ActivityRemoteEntity {
    id: string;
    name: string;
    iconUrl?: string;
    highQualityIconUrl?: string;
    distanceOfStep?: float64;
    maxStrideBySecond?: float64;
    type: string;
    autopauseInterval?: int32;
    mobilityReasonIds?: string[];
}

model ActivityMobilityReasonRemoteEntity {
    id: string;
    name: string;
    description?: string;
    categoriesIdOrdered?: string[];
    iconUrl?: string;
}

model ActivityDeclarableRemoteEntity {
    id?: string;
    name?: string;
    iconUrl?: string;
}

model ActivitiesDeclarableRemoteEntity {
    iconUrl?: string;
    canDeclare?: boolean;
    minDuration?: int32;
    maxDuration?: int32;
    activities?: ActivityDeclarableRemoteEntity[];
}

model ActivitiesRemoteEntity {
    categories?: ActivityCategoryRemoteEntity[];
    activities?: ActivityRemoteEntity[];
    declarableActivities?: ActivitiesDeclarableRemoteEntity;
    mobilityReasons?: ActivityMobilityReasonRemoteEntity[];
}

model LegacyMissionRemoteEntity {
    type: LegacyMissionType;
    isOneShot: boolean;
    goalProgress: int32;
    isDuration: boolean;
    goal: int32;
    remainingDuration: int32;
    points: int32;
    isSucceeded: boolean;
}

model LegacyActivityRemoteEntity {
    id: string;
    type: string;
    image?: string;
    publicImage?: string;
    value: int32;
    missions?: LegacyMissionRemoteEntity[];
}

model SportSessionBodyRemoteEntity {
    isSharable?: boolean;
    mobilityReason?: string;
    isMobility?: boolean;
}

model SportSessionHistoryRemoteEntity {
    id: string;
    date: string;
    points: int32;
    value: int32;
    type: string;
}

model SportSessionSummaryActivityRemoteEntity {
    id: string;
    name: string;
    icon?: string;
    iconHighQuality?: string;
    startAt: string;
    endAt: string;
    duration: float64;
    distance: float64;
    elevation?: float64;
    speed?: float64;
    pace?: float64;
    points?: float64;
    status: string;
    co2Used?: float64;
    co2Saved?: float64;
}

model SportSessionSummaryRemoteEntity {
    id: string;
    name?: string;
    icon?: string;
    startAt: string;
    endAt: string;
    polylines?: string[];
    duration: float64;
    distance: float64;
    elevation?: float64;
    speed?: float64;
    pace?: float64;
    points?: int32;
    status: string;
    source?: string;
    externalActivityUrl?: string;
    co2Icon?: string;
    co2Used?: float64;
    co2Saved?: float64;
    co2ComparisonSource?: string;
    mobilityReason?: string;
    isActivityShared: boolean;
    activities?: SportSessionSummaryActivityRemoteEntity[];
    cheatReason?: string;
    cheatIconUrl?: string;
}

model ActivityHistoryAchieversElementRemoteEntity {
    id: string;
    image?: string;
    firstName: string;
    lastName: string;
    isUserDeleted: boolean;
}

model ActivityHistoryDetailsElementRemoteEntity {
    id: string;
    name?: string;
    icon?: string;
    image?: string;
    duration?: float64;
    distance?: float64;
    number?: float64;
    text?: string;
    achievers?: ActivityHistoryAchieversElementRemoteEntity[];
}

model ActivityHistoryElementRemoteEntity {
    id: string;
    date: string;
    type: string;
    missionType?: string;
    points?: float64;
    isUserDeleted: boolean;
    activityDetail: ActivityHistoryDetailsElementRemoteEntity;
    achievers?: ActivityHistoryAchieversElementRemoteEntity[];
}

model ActivityHistoryRemoteEntity {
    seasonAvailable?: RankingSeasonAvailableRemoteEntity[];
    season?: RankingSeasonAvailableRemoteEntity;
    offsetQueryParam?: OffsetQueryParamsRemoteEntity;
    elements: ActivityHistoryElementRemoteEntity[];
}

model ActivityQuizHistoryRemoteEntity {
    id: string;
    type: string;
    date: string;
    value: string;
    points: int32;
}

model ActivityQuizAnswerRemoteEntity {
    id: string;
    value: string;
    isSelected?: boolean;
    isCorrect?: boolean;
}

model ActivityQuizRemoteEntity {
    id: string;
    image?: string;
    question: string;
    description: string;
    points: int32;
    remainingTime?: int32;
    isAnswered: boolean;
    correctAnswer: boolean;
    urlAnswer?: string;
    type: string;
    answers?: ActivityQuizAnswerRemoteEntity[];
}

model ActivityQuizPostAnswerRemoteEntity {
    answer?: string;
    answers?: string[];
}

model DeclaredActivityRemoteEntity {
    id: string;
    duration: int32;
}

@tag("Activity")
@route("api")
interface ActivityService {
    @route("3.0/quizzes/un-answered")
    @get
    getUnansweredQuizzes(): QuizSummaryRemoteEntity[];

    @sharedRoute
    @route("2.0/my/activities/{activityID}")
    @get
    getActivityMissions(
        @path activityID: string,
    ): ActivityMissionHistoryRemoteEntity[];

    @route("3.0/user-activity-groups/{userActivityGroupId}/segments")
    @get
    getUserActivityGroupSegments(
        @path userActivityGroupId: string,
    ): SportSessionSummarySegmentRemoteEntity[];

    @sharedRoute
    @route("3.0/my/activities/{activityID}/{id}")
    @get
    getActivityGpsDetails(
        @path activityID: string,
        @path id: string,
    ): ActivityGpsDetailsRemoteEntity;

    @route("2.0/my/quiz")
    @get
    getMyQuizzes(): ActivityHomeQuizRemoteEntity[];

    @route("4.0/histories/gps{?filter-by,since-date}")
    @get
    getGpsHistories(
        @query("filter-by") filterBy: string,
        @query("since-date") sinceDate: string,
    ): ActivitiesHistoryRemoteEntity;

    @route("3.0/my/activities/{activityID}/{id}")
    @patch
    updateActivityGpsDetails(
        @path activityID: string,
        @path id: string,
        @body activityGpsBodyRemoteEntity: ActivityGpsBodyRemoteEntity,
    ): void;

    @sharedRoute
    @route("2.0/my/activities/{activityID}")
    @get
    getActivityGpsHistory(
        @path activityID: string,
    ): ActivityGpsHistoryRemoteEntity[];

    @route("3.0/activities")
    @get
    getActivities(): ActivitiesRemoteEntity;

    @route("3.0/activities/declared")
    @post
    postDeclaredActivity(
        @body declaredActivityRemoteEntity: DeclaredActivityRemoteEntity,
    ): void;

    @route("2.0/my/activities")
    @get
    getMyActivities(): LegacyActivityRemoteEntity[];

    @sharedRoute
    @route("3.0/user-activity-groups/{userActivityGroupId}")
    @patch
    updateUserActivityGroup(
        @path userActivityGroupId: string,
        @body sportSessionBodyRemoteEntity: SportSessionBodyRemoteEntity,
    ): void;

    @route("3.0/user-activity-groups")
    @get
    getUserActivityGroups(): SportSessionHistoryRemoteEntity[];

    @route("4.0/histories/activity-gps/{id}")
    @get
    getActivityGpsSummary(@path id: string): SportSessionSummaryRemoteEntity;

    @route("3.0/quizzes/answered")
    @get
    getAnsweredQuizzes(): QuizSummaryRemoteEntity[];

    @route("4.0/histories/{type}/{seasonId}{?date,page}")
    @get
    getHistories(
        @path type: string,
        @path seasonId: string,
        @query date?: string,
        @query page?: string,
        @header(#{ name: "Cache-Control" }) cacheControl: string,
    ): ActivityHistoryRemoteEntity;

    @sharedRoute
    @route("2.0/my/activities/{activityID}")
    @get
    getDeclaredActivityHistory(
        @path activityID: string,
    ): ActivityDeclaredHistoryRemoteEntity[];

    @sharedRoute
    @route("2.0/my/activities/{activityID}")
    @get
    getActivityQuizHistory(
        @path activityID: string,
    ): ActivityQuizHistoryRemoteEntity[];

    @sharedRoute
    @route("2.0/my/activities/{activityID}/{id}")
    @get
    getActivityQuiz(
        @path activityID: string,
        @path id: string,
    ): ActivityQuizRemoteEntity;

    @route("2.0/my/activities/{activityID}/{id}")
    @post
    postActivityQuizAnswer(
        @path activityID: string,
        @path id: string,

        @body
        activityQuizPostAnswerRemoteEntity: ActivityQuizPostAnswerRemoteEntity,
    ): ActivityQuizRemoteEntity;
}
