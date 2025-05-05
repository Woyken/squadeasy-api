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

/*
EXAMPLE request

{
    method: 'GET',
    headers: {
    'content-type': 'application/json',
    'accept-type': 'application/json',
    'accept-language': 'en-US',
    platform: 'Android',
    'platform-version': '14',
    'platform-name': 'aaaaaaa aaaaaaa',
    'client-version': '2.6.2',
    'client-build-version': '2060203',
    'client-unit-system': 'STANDARD',
    'client-white-label-id': 'challenge',
    'vendor-identifier': 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    authorization: 'Bearer eyxxx',
    cookie: 'xxx',
    host: 'api.ms.squadeasy.com',
    connection: 'Keep-Alive',
    'accept-encoding': 'gzip',
    'user-agent': 'okhttp/5.0.0-alpha.12'
}
*/

model CommonMsParams {
    @header("client-white-label-id") clientWhiteLabelId: "challenge" | string;
}

@tag("Chat")
interface ChatService {
    @route("/chat/api/1.0/chat")
    @get
    getChats(...CommonMsParams): ChatConversationRemoteEntity[];

    @route("/chat/api/1.0/chat/broadcast")
    @get
    getBroadcastChat(...CommonMsParams): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/direct/{id}")
    @get
    getDirectChat(
        ...CommonMsParams,
        @path id: string,
    ): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/{chatType}/chat")
    @post
    postChatMessage(
        ...CommonMsParams,
        @path chatType: string,
        @body chatPostMessageRemoteEntity: ChatPostMessageRemoteEntity,
    ): void;

    @route("/chat/api/1.0/chat/{chatType}/messages{?sinceDate}")
    @get
    getChatMessages(
        ...CommonMsParams,
        @path chatType: string,
        @query sinceDate: string,
    ): ChatMessageRemoteEntity[];

    @route("/chat/api/1.0/chat/team")
    @get
    getTeamChat(...CommonMsParams): ChatConversationDetailsRemoteEntity;

    @route("/chat/api/1.0/chat/{chatType}/{id}/messages{?sinceDate}")
    @get
    getChatMessagesById(
        ...CommonMsParams,
        @path chatType: string,
        @path id: string,
        @query sinceDate: string,
    ): ChatMessageRemoteEntity[];

    @route("/chat/api/1.0/chat/direct/{id}/chat")
    @post
    postDirectChatMessage(
        ...CommonMsParams,
        @path id: string,
        @body chatPostMessageRemoteEntity: ChatPostMessageRemoteEntity,
    ): void;
}
