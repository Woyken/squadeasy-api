import "@typespec/http";
using Http;

namespace SquadEasyMSApi;

// @Json(name = "deviceId") @NotNull String id, @Json(name = "token") @Nullable String str
model NotificationTokenBodyRemoteEntity {
    deviceId: string;
    token: string;
}

@tag("Notification")
interface NotificationService {
    @route("/notifications/1.0/tokens-delete")
    @post
    deleteNotificationToken(
        ...CommonMsParams,

        @body
        notificationTokenBodyRemoteEntity: NotificationTokenBodyRemoteEntity,
    ): void;

    @route("/notifications/1.0/tokens-create")
    @post
    createNotificationToken(
        ...CommonMsParams,

        @body
        notificationTokenBodyRemoteEntity: NotificationTokenBodyRemoteEntity,
    ): void;
}
