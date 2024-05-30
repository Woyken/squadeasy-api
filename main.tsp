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
@useAuth(BearerAuth)
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
  @useAuth(NoAuth)
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

@tag("User")
interface User {
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
  updateUser(
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
}

@tag("Social")
interface Social {
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

model ActivityHistory {
  id: string;
  name: "Fast walking" | "Run" | string;
  icon: url;
  startAt: utcDateTime;
  endAt: utcDateTime;
  polylines: string[];
  duration: int32;
  distance: int32;
  elevation: int32;
  points: int32;
  source: "GARMIN" | string;
  cheat: boolean;
  co2ComparisonSource: "datagir" | string;
  mobilityReason: "Recreational sports" | string;
  isActivityShared: boolean;
  activities: unknown[];
  speed: float64;
  pace: float64;
  status: "OK" | string;
  externalActivityUrl: null | unknown;
}

model ActivityHistoryList {
  filters: {
    filterBy: "MONTH" | string;
    sinceDate: utcDateTime;
    minDatePossible: utcDateTime;
    maxDatePossible: utcDateTime;
  };
  highlights: {
    name: string;
    value: int32;
    SIType: string;
  }[];
  activities: {
    id: string;
    name: string;
    icon: url;
    date: utcDateTime;
    duration: int32;
    distance: int32;
    points: int32;
    status: string;
    command: {
      name: string;
      params: {
        ACTIVITY_ID: string;
      };
    };
  }[];
}

@tag("Activity")
interface Activity {
  @route("/api/4.0/histories/gps")
  @get
  activityHistoryList(): ActivityHistoryList;

  @route("/api/4.0/histories/gps/{id}")
  @get
  activityHistory(@path("id") id: string): ActivityHistory;
}

model RankingTeam {
  id: string;
  name: string;
  points: int32;
  rank: int32;
  image: null | url;
}

model RankingMedal {
  id: string;
  minimalRank: int32;
  image: url;
  defaultImage: string;
  color: string;
  description: string;
  name: string;
}

@tag("Ranking")
interface Ranking {
  @route("/api/2.0/my/ranking/season")
  @get
  rankingSeason(): {
    rank: int32;
    teams: RankingTeam[];
    medals: RankingMedal[];
  };

  rankingGlobal(): {
    rank: int32;
    teams: RankingTeam[];
    medals: RankingMedal[];
  };
}

model Team {
  name: string;
  id: string;
  isDestructible: boolean;
  spaceId: string;
  captainId: string;
  image: null | url;
  rank: int32;
  totalPoints: null | int32;
  users: string[];
  isPrivate: boolean;
}

model TeamDetails {
  id: string;
  totalPoints: int32;
  rank: int32;
  image: null | url;
  name: string;
  code: string;
  captainId: string;
  isPrivate: boolean;
  users: {
    id: string;
    points: int32;
    firstName: string;
    lastName: string;
    image: null | url;
    isActivityPublic: boolean;
    isCaptain: boolean;
    isBoostable: boolean;
    boostCount: int32;
  }[];
  boostAvailableAt?: utcDateTime;
}

@tag("Team")
interface TeamService {
  @route("/api/2.0/teams")
  @get
  teams(): Team[];

  @route("/api/2.0/teams/{id}")
  @get
  teamDetails(@path("id") id: string): TeamDetails;

  @route("/api/2.0/my/team")
  @get
  myTeam(): TeamDetails;
}
