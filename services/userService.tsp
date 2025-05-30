import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "consentBasics") @Nullable Boolean bool, @Json(name = "consentDataShare") @Nullable Boolean bool2, @Json(name = "consentMarketing") @Nullable Boolean bool3
model UserLegalConsentRemoteEntity {
    consentBasics?: boolean;
    consentDataShare?: boolean;
    consentMarketing?: boolean;
}
// @Json(name = "status") @NotNull String status
model UserStatusRemoteEntity {
    status: string;
}

// @Nullable String firstName, @Nullable String lastName, @Nullable Boolean isActivityPublic, @Nullable String languageCode
model UserEditRemoteEntity {
    firstName?: string;
    lastName?: string;
    isActivityPublic?: boolean;
    languageCode?: string;
}

// @Json(name = "newPassword") @NotNull String newPassword, @Json(name = "oldPassword") @NotNull String oldPassword
model UserPasswordRemoteEntity {
    newPassword: string;
    oldPassword: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "fullName") @NotNull String fullName, @Json(name = "teamName") @Nullable String str, @Json(name = "image") @Nullable String str2, @Json(name = "publicImage") @Nullable String str3
model UserSearchRemoteEntity {
    id: string;
    fullName: string;
    teamName?: string;
    image?: string;
    publicImage?: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "option") @NotNull String option
model UserClassificationAnswerRemoteEntity {
    id: string;
    option: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "question") @NotNull String question, @Json(name = "options") @Nullable List<UserClassificationAnswerRemoteEntity> list, @Json(name = "selectedOption") @Nullable String str
model UserClassificationRemoteEntity {
    id: string;
    question: string;
    options?: UserClassificationAnswerRemoteEntity[];
    selectedOption?: string;
}

// @Json(name = "isMandatory") boolean z, @Json(name = "userClassifications") @Nullable List<UserClassificationRemoteEntity> list
model UserClassificationsRemoteEntity {
    isMandatory: boolean;
    userClassifications?: UserClassificationRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "email") @Nullable String str, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName, @Json(name = "image") @Nullable String str2, @Json(name = "publicImage") @Nullable String str3, @Json(name = "isActivityPublic") @Nullable Boolean bool, @Json(name = "boostCount") @Nullable Integer num, @Json(name = "isBoostable") @Nullable Boolean bool2, @Json(name = "isCaptain") @Nullable Boolean bool3, @Json(name = "languageCode") @Nullable String str4, @Json(name = "teamId") @Nullable String str5, @Json(name = "teamName") @Nullable String str6, @Json(name = "points") @Nullable Double d2, @Json(name = "entityId") @Nullable String str7
model UserRemoteEntity {
    id: string;
    email?: string;
    firstName: string;
    lastName: string;
    image?: string;
    publicImage?: string;
    isActivityPublic?: boolean;
    boostCount?: int32;
    isBoostable?: boolean;
    isCaptain?: boolean;
    languageCode?: string;
    teamId?: string;
    teamName?: string;
    points?: float;
    entityId?: string;
}

// @Json(name = "activityId") @NotNull String id, @Json(name = "type") @NotNull String type, @Json(name = "points") int i2, @Json(name = "value") int i3, @Json(name = "title") @NotNull String title, @Json(name = "isHistoryEmpty") boolean z
model UserActivityStatsRemoteEntity {
    activityId: string;
    type: string;
    points: int32;
    value: int32;
    title: string;
    isHistoryEmpty: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName, @Json(name = "image") @Nullable String str, @Json(name = "publicImage") @Nullable String str2, @Json(name = "teamId") @Nullable String str3, @Json(name = "teamName") @Nullable String str4, @Json(name = "totalPoints") int i2, @Json(name = "isActivityPublic") boolean z, @Json(name = "boostedBy") @NotNull List<String> boostedBy, @Json(name = "isBoostable") boolean z2, @Json(name = "activities") @Nullable List<UserActivityStatsRemoteEntity> list, @Json(name = "entityName") @Nullable String str5, @Json(name = "isBlocked") boolean z3
model UserStatsRemoteEntity {
    id: string;
    firstName: string;
    lastName: string;
    image?: string;
    publicImage?: string;
    teamId?: string;
    teamName?: string;
    totalPoints: int32;
    isActivityPublic: boolean;
    boostedBy: string[];
    isBoostable: boolean;
    activities?: UserActivityStatsRemoteEntity[];
    entityName?: string;
    isBlocked: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "imageUrl") @Nullable String str, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName
model UserProfileBoostedByRemoteEntity {
    id: string;
    imageUrl?: string;
    firstName: string;
    lastName: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @NotNull String name, @Json(name = "value") double d2, @Json(name = "SIType") @NotNull String type
model UserProfileActivityRemoteEntity {
    id: string;
    name: string;
    value: float;
    SIType: string;
}

// @Json(name = "id") @NotNull String id, @Json(name = "isCurrentUser") boolean z, @Json(name = "name") @NotNull String name, @Json(name = "teamName") @NotNull String teamName, @Json(name = "entityName") @Nullable String str, @Json(name = "isInSameTeam") boolean z2, @Json(name = "imageUrl") @Nullable String str2, @Json(name = "isBlocked") boolean z3, @Json(name = "isPrivate") boolean z4, @Json(name = "isBoostable") boolean z5, @Json(name = "canSendMessage") boolean z6, @Json(name = "points") @Nullable String str3, @Json(name = "boostedBy") @Nullable List<UserProfileBoostedByRemoteEntity> list, @Json(name = "activities") @Nullable List<UserProfileActivityRemoteEntity> list2
model UserProfileRemoteEntity {
    id: string;
    isCurrentUser: boolean;
    name: string;
    teamName: string;
    entityName?: string;
    isInSameTeam: boolean;
    imageUrl?: string;
    isBlocked: boolean;
    isPrivate: boolean;
    isBoostable: boolean;
    canSendMessage: boolean;
    points?: string;
    boostedBy?: UserProfileBoostedByRemoteEntity[];
    activities?: UserProfileActivityRemoteEntity[];
}

// @Json(name = "id") @NotNull String id, @Json(name = "firstName") @NotNull String firstName, @Json(name = "lastName") @NotNull String lastName, @Json(name = "image") @Nullable String str
model UserBlockedRemoteEntity {
    id: string;
    firstName: string;
    lastName: string;
    image?: string;
}

@tag("User")
@route("api")
interface UserService {
    @route("3.0/users/me/accept-legals-consent")
    @post
    acceptLegalConsent(
        @body userLegalConsentRemoteEntity: UserLegalConsentRemoteEntity,
    ): void;

    @route("2.0/users/{id}/boost")
    @post
    boostUser(@path id: string): void;

    @route("3.0/user-status")
    @get
    getUserStatus(): UserStatusRemoteEntity;

    @route("3.0/users/me/accept-legals-consent")
    @get
    getAcceptedLegalConsents(): string[];

    @route("2.0/my/user")
    @patch
    updateCurrentUser(@body userEditRemoteEntity: UserEditRemoteEntity): void;

    @route("2.0/my/password")
    @patch
    updatePassword(
        @body userPasswordRemoteEntity: UserPasswordRemoteEntity,
    ): void;

    @route("2.0/users/{id}/block")
    @post
    blockUser(@path id: string): void;

    @route("2.0/users/search")
    @post
    searchUsers(
        @body teamSearchBodyRemoteEntity: TeamSearchBodyRemoteEntity,
    ): UserSearchRemoteEntity[];

    @route("3.0/user-classifications")
    @get
    getUserClassifications(): UserClassificationsRemoteEntity;

    @route("2.0/my/user")
    @delete
    deleteCurrentUser(): void;

    @route("2.0/users/{id}/unblock")
    @post
    unblockUser(@path id: string): void;

    @route("2.0/users/{id}")
    @get
    getUser(@path id: string): UserRemoteEntity;

    @route("2.0/users/{id}/statistics")
    @get
    getUserStatistics(@path id: string): UserStatsRemoteEntity;

    @route("2.0/users")
    @get
    getUsers(): UserRemoteEntity[];

    @route("3.0/user-profile/{userId}")
    @get
    getUserProfile(@path userId: string): UserProfileRemoteEntity;

    @route("2.0/my/user")
    @get
    getCurrentUser(): UserRemoteEntity;

    @route("3.0/users/blocked-users")
    @get
    getBlockedUsers(): UserBlockedRemoteEntity[];

    @route("3.0/user-classifications")
    @post
    setUserClassifications(
        @body list: UserClassificationAnswerRemoteEntity[],
    ): void;

    @route("2.0/my/statistics")
    @get
    getCurrentUserStatistics(): UserStatsRemoteEntity;

    @route("2.0/my/image")
    @post
    uploadCurrentUserImage(
        @header `content-type`: "multipart/form-data",
        @multipartBody body: {
            image: HttpPart<File>;
        },
    ): void;
}
