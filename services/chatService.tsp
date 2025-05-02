import "@typespec/http";
using Http;

namespace SquadEasyMSApi;

// @Json(name = "id") @Nullable String str, @Json(name = "image") @Nullable String str2, @Json(name = "publicImage") @Nullable String str3, @Json(name = "name") @NotNull String name, @Json(name = "updatedAt") @NotNull String updatedAt, @Json(name = "isRead") boolean z, @Json(name = "isMuted") @Nullable Boolean bool, @Json(name = "type") @NotNull String type, @Json(name = "lastMessage") @Nullable String str4
model ChatConversationRemoteEntity {
    id?: string;
    image?: string;
    publicImage?: string;
    name: string;
    updatedAt: string;
    isRead: boolean;
    isMuted?: boolean;
    type: string;
    lastMessage?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "type") @NotNull String type, @Json(name = "message") @Nullable String str, @Json(name = "mediaUrl") @Nullable String str2, @Json(name = "senderId") @NotNull String senderId, @Json(name = "createdAt") @NotNull String createdAt
model ChatMessageRemoteEntity {
    id: string;
    type: string;
    message?: string;
    mediaUrl?: string;
    senderId: string;
    createdAt: string;
}

// @Json(name = "createdAt") @Nullable String str, @Json(name = "updatedAt") @Nullable String str2, @Json(name = "type") @NotNull String type, @Json(name = "members") @Nullable List<UserRemoteEntity> list, @Json(name = "messages") @Nullable List<ChatMessageRemoteEntity> list2
model ChatConversationDetailsRemoteEntity {
    createdAt?: string;
    updatedAt?: string;
    type: string;
    members?: SquadEasyApi.UserRemoteEntity[];
    messages?: ChatMessageRemoteEntity[];
}

// @Json(name = "message") @NotNull String message
model ChatPostMessageRemoteEntity {
    message: string;
}

// TODO, base url is this: https://api.ms.squadeasy.com
@tag("Chat")
@route("api")
interface ChatService {
    @route("/chat/api/1.0/chat")
    @get
    getTODO_chat_api_1_0_chat(): ChatConversationRemoteEntity[];

    @route("/chat/api/1.0/chat/broadcast")
    @get
    getTODO_chat_api_1_0_chat_broadcast(): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/direct/{id}")
    @get
    getTODO_chat_api_1_0_chat_direct__id_(
        @path id: string,
    ): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/{chatType}/chat")
    @post
    postTODO_chat_api_1_0_chat__chatType__chat(
        @path chatType: string,
        @body chatPostMessageRemoteEntity: ChatPostMessageRemoteEntity,
    ): void;

    @route("/chat/api/1.0/chat/{chatType}/messages{?sinceDate}")
    @get
    getTODO_chat_api_1_0_chat__chatType__messages(
        @path chatType: string,
        @query sinceDate: string,
    ): ChatMessageRemoteEntity[];

    @route("/chat/api/1.0/chat/team")
    @get
    getTODO_chat_api_1_0_chat_team(): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/{chatType}/{id}/messages{?sinceDate}")
    @get
    getTODO_chat_api_1_0_chat__chatType___id__messages(
        @path chatType: string,
        @path id: string,
        @query sinceDate: string,
    ): ChatMessageRemoteEntity[];

    @route("/chat/api/1.0/chat/direct/{id}/chat")
    @post
    postTODO_chat_api_1_0_chat_direct__id__chat(
        @path id: string,
        @body chatPostMessageRemoteEntity: ChatPostMessageRemoteEntity,
    ): void;
}
