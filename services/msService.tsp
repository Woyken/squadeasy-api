import "@typespec/http";
using Http;

namespace SquadEasyMSApi;

// @Json(name = "isSimulatedBySoftware") @Nullable Boolean bool, @Json(name = "isProducedByAccessory") boolean z
model ChunkLocationSourceInformationRemoteEntity {
    isSimulatedBySoftware?: boolean;
    isProducedByAccessory: boolean;
}

// @Json(name = "timestamp") @NotNull String timestamp, @Json(name = "latitude") double d2, @Json(name = "longitude") double d3, @Json(name = "altitude") double d4, @Json(name = "ellipsoidalAltitude") @Nullable Double d5, @Json(name = "horizontalAccuracy") float f2, @Json(name = "verticalAccuracy") float f3, @Json(name = "speed") float f4, @Json(name = "speedAccuracy") float f5, @Json(name = "floor") @Nullable Integer num, @Json(name = "sourceInformation") @NotNull ChunkLocationSourceInformationRemoteEntity sourceInformation
model ChunkLocationRemoteEntity {
    timestamp: string;
    latitude: float64;
    longitude: float64;
    altitude: float64;
    ellipsoidalAltitude?: float64;
    horizontalAccuracy: float32;
    verticalAccuracy: float32;
    speed: float32;
    speedAccuracy: float32;
    floor?: int32;
    sourceInformation: ChunkLocationSourceInformationRemoteEntity;
}

// @Json(name = "timestamp") @NotNull String timestamp, @Json(name = "magneticHeading") double d2, @Json(name = "headingAccuracy") double d3
model ChunkHeadingRemoteEntity {
    timestamp: string;
    magneticHeading: float64;
    headingAccuracy: float64;
}

// @Json(name = "toto") @NotNull String toto
model ChunkMotionsRemoteEntity {
    toto: string;
}

// @Json(name = "sessionId") @NotNull String sessionId, @Json(name = "activityId") @NotNull String activityId, @Json(name = "currentActivityId") @NotNull String currentActivityId, @Json(name = "state") @NotNull String state, @Json(name = "mobilityReasonId") @Nullable String str, @Json(name = "isInitial") @Nullable Boolean bool, @Json(name = "isOver") @Nullable Boolean bool2, @Json(name = "isCancel") @Nullable Boolean bool3
model ChunkMetadataRemoteEntity {
    sessionId: string;
    activityId: string;
    currentActivityId: string;
    state: string;
    mobilityReasonId?: string;
    isInitial?: boolean;
    isOver?: boolean;
    isCancel?: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "createdAt") @NotNull String createdAt, @Json(name = "updatedAt") @NotNull String updatedAt, @Json(name = "steps") int i2, @Json(name = "locations") @Nullable List<ChunkLocationRemoteEntity> list, @Json(name = "headings") @Nullable List<ChunkHeadingRemoteEntity> list2, @Json(name = "motions") @Nullable ChunkMotionsRemoteEntity chunkMotionsRemoteEntity, @Json(name = "metadata") @NotNull ChunkMetadataRemoteEntity metadata
model ChunkRemoteEntity {
    id: string;
    createdAt: string;
    updatedAt: string;
    steps: int32;
    locations?: ChunkLocationRemoteEntity[];
    headings?: ChunkHeadingRemoteEntity[];
    motions?: ChunkMotionsRemoteEntity;
    metadata: ChunkMetadataRemoteEntity;
}

// @NotNull String id, boolean z
model UserNotificationBodyRemoteEntity {
    id: string;
    enabled: boolean;
}

// @NotNull String id, boolean z, @NotNull String title
model UserNotificationRemoteEntity {
    id: string;

    // is this 'z' or 'isEnabled'?
    isEnabled: string;

    title: string;
}

// TODO, base url is this: https://api.ms.squadeasy.com
@tag("MS")
@route("api")
interface MSService {
    @route("tracker/1.0/chunks")
    @post
    postTODOtracker_1_0_chunks(
        @body chunkRemoteEntity: ChunkRemoteEntity,
    ): string[];

    @route("/notifications/1.0/user-preferences")
    @patch
    patchTODO_notifications_1_0_user_preferences(
        @body
        userNotificationBodyRemoteEntity: UserNotificationBodyRemoteEntity,
    ): UserNotificationRemoteEntity[];

    @route("/notifications/1.0/user-preferences")
    @get
    getTODO_notifications_1_0_user_preferences(
    ): UserNotificationRemoteEntity[];
}
