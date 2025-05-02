import "@typespec/http";
using Http;

namespace SquadEasyMSApi;

// @Json(name = "id") @NotNull String id, @Json(name = "createdAt") @NotNull String createdAt, @Json(name = "updatedAt") @NotNull String updatedAt, @Json(name = "steps") int i2, @Json(name = "locations") @Nullable List<ChunkLocationRemoteEntity> list, @Json(name = "headings") @Nullable List<ChunkHeadingRemoteEntity> list2, @Json(name = "motions") @Nullable ChunkMotionsRemoteEntity chunkMotionsRemoteEntity, @Json(name = "metadata") @NotNull ChunkMetadataRemoteEntity metadata
model ChunkRemoteEntity {}

// @NotNull String id, boolean z
model UserNotificationBodyRemoteEntity {}

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
