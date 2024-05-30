import "@typespec/http";

using TypeSpec.Http;

@doc("""
SquadEasy API

Reverse engineered API from SquadEasy app (`co.livehappier.squadV2`)

Repo: <https://github.com/Woyken/squadeasy-api>

Authorization flow:

`POST /api/3.0/auth/login` with email and password, returns accessToken and refreshToken

`POST /api/3.0/auth/refresh-token` to refresh token after it expires

All other endpoints will require accessToken in Authorization header
""")
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

model TokenResponse {
  accessToken: string;
  refreshToken: string;
}

@tag("Authentication")
interface Authentication {
  @route("/api/3.0/auth/login")
  @post
  login(
    @body body: {
      email: string;
      password: string;
    },
  ): TokenResponse;

  @route("/api/3.0/auth/refresh-token")
  @post
  refreshToken(@header `Refresh-Token`: string): TokenResponse;
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
