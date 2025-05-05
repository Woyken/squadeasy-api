import "@typespec/http";
using Http;

namespace SquadEasyMSApi;

// @Json(name = "deviceId") @NotNull String id, @Json(name = "token") @Nullable String str
model NotificationTokenBodyRemoteEntity {
    deviceId: string;
    token: string;
}

// TODO, base url is this: https://api.ms.squadeasy.com
@tag("Notification")
@route("api")
interface NotificationService {
    @route("/notifications/1.0/tokens-delete")
    @post
    deleteNotificationToken(
        @body
        notificationTokenBodyRemoteEntity: NotificationTokenBodyRemoteEntity,
    ): void;

    @route("/notifications/1.0/tokens-create")
    @post
    createNotificationToken(
        @body
        notificationTokenBodyRemoteEntity: NotificationTokenBodyRemoteEntity,
    ): void;
}
