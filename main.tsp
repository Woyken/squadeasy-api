import "@typespec/http";

using TypeSpec.Http;

@server("https://api-challenge.squadeasy.com", "API endpoint")
@service({
  title: "SquadEasy API",
})
namespace SquadEasyApi;

model ImageData {
  @header contentType: "multipart/form-data";

  @format("binary")
  image: string;
}

interface Authentication {
  @route("/api/3.0/auth/login")
  @post
  login(
    @body body: {
      email: string;
      password: string;
    },
  ): {
    accessToken: string;
    refreshToken: string;
  };
}

enum UserStatus {
  OK,
  NEED_UPDATE,
}

model SocialPost {
  id: string;
  createdAt: string;
  updatedAt?: string;
  hasModeratorRole: boolean;
  isPinned: boolean;
  sender: {
    id: string;
    firstName: string;
    lastName: string;
    image?: string;
    teamName: string;
    teamId: string;
  };
  content: {
    isEdited: boolean;
    message?: string;
    images: string[];
    socialtag?: string;
    points?: int32;
  };
  likes: {
    count: int32;
    isLikedByUser: boolean;
    images?: string[];
    firstName?: string;
    lastName?: string;
  };
  comments: unknown[];
}

interface Account {
  @route("/api/2.0/my/image")
  @post
  uploadImage(...ImageData): CreatedResponse & Body<{}>;

  @route("/api/3.0/user-status")
  @get
  userStatus(): {
    status: UserStatus;
  };

  @route("/api/2.0/my/user")
  @get
  user(): {
    id: string;
    firstName: string;
    lastName: string;
    email: string;
    userRole: "user" | string;
    userStatus: UserStatus;
    imageUpdatedAt: utcDateTime;
    isActivityPublic: boolean;
    spaceId: string;
    teamId: string;
    languageCode: "en" | string;
    entityId: string | null;
    platform: "Android" | string;
    platformVersion: string;
    clientVersion: string;
    platformName: string;
    lastConnectionDate: utcDateTime;
    consentDataShareDate: utcDateTime;
    consentBasicsDate: utcDateTime;
    cheatLevel: "CLEAR" | string;
    image: string;
    isCaptain: boolean;
    boostCount: int32;
  };

  @route("/api/2.0/my/user")
  @patch
  changeUser(
    @body body: {
      firstName?: string;
      lastName?: string;
      isActivityPublic?: boolean;
      languageCode: "en" | string;
    },
  ): {
    firstName: string;
    lastName: string;
    email: string;
    isActivityPublic: boolean;
    languageCode: "en" | string;
    id: string;
    userRole: "user" | string;
  };

  @route("/api/3.0/social/posts")
  @get
  posts(): SocialPost[];

  @route("/api/3.0/social/posts")
  @post
  createPost(
    @body body: {
      message: string;
    },
  ): SocialPost;
}
