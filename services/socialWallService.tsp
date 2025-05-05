import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "message") @NotNull String message
model SocialPostMessageBodyRemoteEntity {
    message: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName, @Json(name = "teamName") @Nullable String str, @Json(name = "teamId") @Nullable String str2, @Json(name = "image") @Nullable String str3
model SocialPostUserLikeRemoteEntity {
    id: string;
    firstName: string;
    lastName: string;
    teamName?: string;
    teamId?: string;
    image?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @NotNull String name, @Json(name = "type") @Nullable String str, @Json(name = "availability") @Nullable String str2, @Json(name = "occurrence") @Nullable Integer num, @Json(name = "points") @Nullable Integer num2, @Json(name = "image") @Nullable String str3, @Json(name = "description") @Nullable String str4
model SocialTagRemoteEntity {
    id: string;
    name: string;
    type?: string;
    availability?: string;
    occurrence?: int32;
    points?: int32;
    image?: string;
    description?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "firstName") @NotNull String firstname, @Json(name = "lastName") @NotNull String lastname, @Json(name = "image") @Nullable String str, @Json(name = "teamId") @Nullable String str2, @Json(name = "teamName") @Nullable String str3
model SocialSenderRemoteEntity {
    id: string;
    firstName: string;
    lastName: string;
    image?: string;
    teamId?: string;
    teamName?: string;
}

// @Json(name = "isEdited") boolean z, @Json(name = "message") @Nullable String str, @Json(name = "images") @Nullable List<String> list, @Json(name = "socialtag") @Nullable String str2, @Json(name = "points") @Nullable Double d2
model SocialWallPostContentRemoteEntity {
    isEdited: boolean;
    message?: string;
    images?: string[];
    socialtag?: string;
    points?: float64;
}

// @Json(name = "isLikedByUser") boolean z, @Json(name = "count") int i2, @Json(name = "images") @Nullable List<String> list, @Json(name = "firstName") @Nullable String str, @Json(name = "lastName") @Nullable String str2
model SocialWallPostLikesRemoteEntity {
    isLikedByUser: boolean;
    count: int32;
    images?: string[];
    firstName?: string;
    lastName?: string;
}

// @Json(name = "message") @NotNull String message
model SocialWallPostCommentContentRemoteEntity {
    message: string;
}

// @Json(name = "isLikedByUser") boolean z, @Json(name = "count") double d2
model SocialWallPostCommentLikesRemoteEntity {
    isLikedByUser: boolean;
    count: float64;
}

// @Json(name = "id") @NotNull String id, @Json(name = "createdAt") @NotNull String createdAt, @Json(name = "sender") @NotNull SocialSenderRemoteEntity sender, @Json(name = "content") @NotNull SocialWallPostCommentContentRemoteEntity content, @Json(name = "likes") @NotNull SocialWallPostCommentLikesRemoteEntity likes
model SocialWallPostCommentRemoteEntity {
    id: string;
    createdAt: string;
    sender: SocialSenderRemoteEntity;
    content: SocialWallPostCommentContentRemoteEntity;
    likes: SocialWallPostCommentLikesRemoteEntity;
}

// @Json(name = "id") @NotNull String id, @Json(name = "createdAt") @NotNull String createdAt, @Json(name = "updatedAt") @Nullable String str, @Json(name = "hasModeratorRole") @Nullable Boolean bool, @Json(name = "isPinned") @Nullable Boolean bool2, @Json(name = "sender") @NotNull SocialSenderRemoteEntity sender, @Json(name = "content") @NotNull SocialWallPostContentRemoteEntity content, @Json(name = "likes") @NotNull SocialWallPostLikesRemoteEntity likes, @Json(name = "comments") @Nullable List<SocialWallPostCommentRemoteEntity> list
model SocialWallPostRemoteEntity {
    id: string;
    createdAt: string;
    updatedAt?: string;
    hasModeratorRole?: boolean;
    isPinned?: boolean;
    sender: SocialSenderRemoteEntity;
    content: SocialWallPostContentRemoteEntity;
    likes: SocialWallPostLikesRemoteEntity;
    comments?: SocialWallPostCommentRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "title") @NotNull String title
model ReportReasonRemoteEntity {
    id: string;
    title: string;
}

// @Json(name = "tag") @Nullable String str, @Json(name = "image") @Nullable String str2, @Json(name = "title") @Nullable String str3, @Json(name = "html") @Nullable String str4
model BlogPostContentRemoteEntity {
    tag?: string;
    image?: string;
    title?: string;
    html?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "createdAt") @NotNull String createdAt, @Json(name = "content") @NotNull BlogPostContentRemoteEntity content
model BlogPostRemoteEntity {
    id: string;
    createdAt: string;
    content: BlogPostContentRemoteEntity;
}

// @Json(name = "id") @NotNull String id, @Json(name = "availability") @Nullable String str, @Json(name = "occurrence") int i2, @Json(name = "remaining") @Nullable Integer num, @Json(name = "name") @NotNull String name, @Json(name = "date") @NotNull String date, @Json(name = "points") int i3, @Json(name = "image") @Nullable String str2, @Json(name = "description") @Nullable String str3
model SocialTagDetailsRemoteEntity {
    id: string;
    availability?: string;
    occurrence: int32;
    remaining?: int32;
    name: string;
    date: string;
    points: int32;
    image?: string;
    description?: string;
}

// @Json(name = "ongoing") @Nullable List<SocialTagDetailsRemoteEntity> list, @Json(name = "upcoming") @Nullable List<SocialTagDetailsRemoteEntity> list2
model SocialTagListRemoteEntity {
    ongoing?: SocialTagDetailsRemoteEntity[];
    upcoming?: SocialTagDetailsRemoteEntity[];
}

// @Json(name = "message") @NotNull String message
model SocialPostEditBodyRemoteEntity {
    message: string;
}

// @Json(name = "date") @NotNull String date, @Json(name = "page") @Nullable String str, @Json(name = "filters") @Nullable List<String> list
model OffsetQueryParamsRemoteEntity {
    date: string;
    page?: string;
    filters?: string[];
}

// @Json(name = "filtersAvailable") @Nullable List<SocialTagRemoteEntity> list, @Json(name = "filters") @NotNull List<String> filters, @Json(name = "offsetQueryParams") @Nullable OffsetQueryParamsRemoteEntity offsetQueryParamsRemoteEntity, @Json(name = "isSocialtagAvailable") boolean z, @Json(name = "elements") @Nullable List<SocialWallPostRemoteEntity> list2
model SocialWallPostsRemoteEntity {
    filtersAvailable: SocialTagRemoteEntity[];
    filters: string[];
    offsetQueryParams?: OffsetQueryParamsRemoteEntity;
    isSocialtagAvailable: boolean;
    elements?: SocialWallPostRemoteEntity[];
}

@tag("SocialWall")
@route("api")
interface SocialWallService {
    @route("3.0/social/posts/{post_id}")
    @post
    createSocialPostById(
        @path post_id: string,
        @body body: SocialPostMessageBodyRemoteEntity,
    ): IdRemoteEntity;

    @sharedRoute
    @route("3.0/social/posts")
    @post
    createSocialPostWithMedia(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            part: HttpPart<unknown>;
            part2: HttpPart<unknown>;
        },
    ): void;

    @route("2.0/social/posts/{post_id}/report")
    @post
    reportSocialPost(
        @path post_id: string,
        @body idRemoteEntity: IdRemoteEntity,
    ): void;

    @route("2.0/social/posts/{post_id}/liked-by")
    @get
    getSocialPostLikes(@path post_id: string): SocialPostUserLikeRemoteEntity[];

    @route("2.0/socialtags")
    @get
    getSocialTags(): SocialTagRemoteEntity[];

    @route("3.0/social/posts/{post_id}/like")
    @delete
    unlikeSocialPost(@path post_id: string): SocialWallPostRemoteEntity;

    @route("3.0/social/posts/{post_id}/like")
    @put
    likeSocialPost(@path post_id: string): SocialWallPostRemoteEntity;

    @route("3.0/social/posts/{post_id}")
    @get
    getSocialPost(@path post_id: string): SocialWallPostRemoteEntity;

    @sharedRoute
    @route("3.0/social/posts")
    @post
    createSocialPostWith2Params(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            part: HttpPart<unknown>;
            part2: HttpPart<unknown>;
        },
    ): void;

    @route("2.0/social/posts/report-reasons")
    @get
    getReportReasons(): ReportReasonRemoteEntity[];

    @sharedRoute
    @route("3.0/social/posts")
    @post
    createSocialPostWith3Params(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            part: HttpPart<unknown>;
            part2: HttpPart<unknown>;
            part3: HttpPart<unknown>;
        },
    ): void;

    @route("3.0/social/posts/{post_id}")
    @delete
    deleteSocialPost(@path post_id: string): void;

    @sharedRoute
    @route("3.0/social/posts")
    @post
    createSocialPostWithMessage(
        @body
        socialPostMessageBodyRemoteEntity: SocialPostMessageBodyRemoteEntity,
    ): void;

    @route("3.0/social/posts/{post_id}/comments/{comment_id}")
    @delete
    deleteSocialPostComment(
        @path post_id: string,
        @path comment_id: string,
    ): SocialWallPostRemoteEntity;

    @route("2.0/blogs/posts/{post_id}")
    @get
    getBlogPost(@path post_id: string): BlogPostRemoteEntity;

    @route("3.0/social/posts/{post_id}/comments/{comment_id}/like")
    @delete
    deleteSocialPostCommentLike(
        @path post_id: string,
        @path comment_id: string,
    ): SocialWallPostRemoteEntity;

    @route("2.0/socialTags/list")
    @get
    getSocialTagList(): SocialTagListRemoteEntity;

    @route("3.0/social/posts/{post_id}/moderate/{actionId}")
    @post
    moderateSocialPost(@path post_id: string, @path actionId: string): void;

    @route("2.0/my/socialtags/available")
    @get
    getMyAvailableSocialTags(): SocialTagRemoteEntity[];

    @route("3.0/social/posts/{post_id}")
    @patch
    updateSocialPost(
        @path post_id: string,
        @body socialPostEditBodyRemoteEntity: SocialPostEditBodyRemoteEntity,
    ): void;

    @route("4.0/social/posts{?date,filters}")
    @get
    getSocialPosts(
        @query date: string,
        @query filters: string,
    ): SocialWallPostsRemoteEntity;

    @route("3.0/social/posts/{post_id}/comments/{comment_id}/like")
    @put
    likeSocialPostComment(
        @path post_id: string,
        @path comment_id: string,
    ): SocialWallPostRemoteEntity;

    @sharedRoute
    @route("3.0/social/posts")
    @post
    createSocialPostWithOnePart(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            part: HttpPart<unknown>;
        },
    ): void;

    @sharedRoute
    @route("3.0/blogs/posts{?sincePostId}")
    @get
    getBlogPosts(@query sincePostId: string): BlogPostRemoteEntity[];

    @sharedRoute
    @route("3.0/blogs/posts")
    @get
    getBlogPostsNoParams(): BlogPostRemoteEntity[];
}
