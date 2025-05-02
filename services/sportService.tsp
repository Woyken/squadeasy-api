import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "steps") int i2, @Json(name = "time") @NotNull String time
model StepsRemoteEntity {
    steps: int32;
    time: string;
}

// @Json(name = "steps") int i2, @Json(name = "elevations") @NotNull List<Long> elevations, @Json(name = "startAt") @NotNull String startAt, @Json(name = "endAt") @NotNull String endAt, @Json(name = "distance") int i3, @Json(name = "duration") long j2, @Json(name = "pauseDuration") long j3, @Json(name = "polyline") @NotNull String polyline, @Json(name = "startLatLng") @NotNull List<Double> startLatlng, @Json(name = "endLatLng") @NotNull List<Double> endLatlng, @Json(name = "activityId") @NotNull String activityId
model SportSegmentRemoteEntity {
    steps: int32;
    elevations: int64[];
    startAt: string;
    endAt: string;
    distance: int32;
    duration: int64;
    pauseDuration: int64;
    polyline: string;
    startLatlng: float64[];
    endLatlng: float64[];
    activityId: string;
}

// @Json(name = "global") double d2, @Json(name = "average") double d3, @Json(name = "min") double d4, @Json(name = "max") double d5, @Json(name = "positiveCumulate") double d6, @Json(name = "negativeCumulate") double d7, @Json(name = "rawElevations") @NotNull List<Double> rawElevations
model SportGpsElevationRemoteEntity {
    global: float64;
    average: float64;
    min: float64;
    max: float64;
    positiveCumulate: float64;
    negativeCumulate: float64;
    rawElevations: float64[];
}

// @Json(name = "startAt") @NotNull String startAt, @Json(name = "endAt") @NotNull String endAt
model SportGpsPauseRemoteEntity {
    startAt: string;
    endAt: string;
}

// @Json(name = "startAt") @NotNull String startAt, @Json(name = "endAt") @NotNull String endAt, @Json(name = "steps") int i2
model SportGpsSignalLostRemoteEntity {
    startAt: string;
    endAt: string;
    steps: int32;
}

// @Json(name = "startAt") @NotNull String startAt, @Json(name = "endAt") @NotNull String endAt, @Json(name = "duration") long j2, @Json(name = "distance") int i2, @Json(name = "elevation") int i3, @Json(name = "elevations") @NotNull SportGpsElevationRemoteEntity elevations, @Json(name = "totalStep") int i4, @Json(name = "polyline") @NotNull String polyline, @Json(name = "startLatLng") @NotNull List<Double> startLatlng, @Json(name = "endLatLng") @NotNull List<Double> endLatlng, @Json(name = "pauses") @NotNull List<SportGpsPauseRemoteEntity> pauses, @Json(name = "stepsWhenGPSLost") @NotNull List<SportGpsSignalLostRemoteEntity> stepsWhenGPSLost
model SportGpsRemoteEntity {
    startAt: string;
    endAt: string;
    duration: int64;
    distance: int32;
    elevation: int32;
    elevations: SportGpsElevationRemoteEntity;
    totalStep: int32;
    polyline: string;
    startLatlng: float64[];
    endLatlng: float64[];
    pauses: SportGpsPauseRemoteEntity[];
    stepsWhenGPSLost: SportGpsSignalLostRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "pingFrequency") int i2
model SportSessionRemoteEntity {
    id: string;
    pingFrequency: int32;
}

// @Json(name = "updatedAt") @NotNull String updatedAt
model StepsInfoRemoteEntity {
    updatedAt: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @NotNull String name, @Json(name = "image") @Nullable String str
model ActivityGroupRemoteEntity {
    id: string;
    name: string;
    image?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @NotNull String name, @Json(name = "isSelected") boolean z
model ActivityGroupMobilityReasonsRemoteEntity {
    id: string;
    name: string;
    isSelected: boolean;
}

// @Json(name = "mobilityReason") @NotNull String mobilityReason
model ActivityGroupMobilityReasonsBodyRemoteEntity {
    mobilityReason: string;
}

@tag("Sport")
@route("api")
interface SportService {
    @route("2.0/my/activities/{id}/manual")
    @post
    postTODO2_0_my_activities__id__manual(
        @path id: string,
        @body list: StepsRemoteEntity[],
    ): void;

    @route("3.0/user-activity-groups/{userActivityGroupId}/segments")
    @post
    postTODO3_0_user_activity_groups__userActivityGroupId__segments(
        @path userActivityGroupId: string,
        @body list: SportSegmentRemoteEntity,
    ): void;

    @route("3.0/user-activity-groups/{userActivityGroupId}/ping")
    @post
    postTODO3_0_user_activity_groups__userActivityGroupId__ping(
        @path userActivityGroupId: string,
    ): void;

    @route("2.0/my/activities/{id}")
    @post
    postTODO2_0_my_activities__id_(
        @path id: string,
        @body sportGpsRemoteEntity: SportGpsRemoteEntity,
    ): IdRemoteEntity;

    @route("3.0/user-activity-groups/start")
    @post
    postTODO3_0_user_activity_groups_start(): SportSessionRemoteEntity;

    @route("4.0/steps/updated-at")
    @get
    getTODO4_0_steps_updated_at(): StepsInfoRemoteEntity;

    @route("3.0/activity-groups/gps")
    @get
    getTODO3_0_activity_groups_gps(): ActivityGroupRemoteEntity[];

    @route("3.0/activity-groups/mobility-reasons")
    @get
    getTODO3_0_activity_groups_mobility_reasons(
    ): ActivityGroupMobilityReasonsRemoteEntity[];

    @route("3.0/user-activity-groups/{userActivityGroupId}/end")
    @post
    postTODO3_0_user_activity_groups__userActivityGroupId__end(
        @path userActivityGroupId: string,
    ): void;

    @sharedRoute
    @route("3.0/user-activity-groups/{userActivityGroupId}")
    @patch
    patchTODO3_0_user_activity_groups__userActivityGroupId_(
        @path userActivityGroupId: string,

        @body
        activityGroupMobilityReasonsBodyRemoteEntity: ActivityGroupMobilityReasonsBodyRemoteEntity,
    ): void;

    @route("2.0/my/activities/walk")
    @post
    postTODO2_0_my_activities__id_walk(
        @path id: string,
        @body list: StepsRemoteEntity[],
    ): void;
}
