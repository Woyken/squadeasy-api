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

model UserDetails {
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
}

model UserStatistics {
  id: string;
  firstName: string;
  lastName: string;
  entityName: null;
  teamName: string;
  teamId: string;
  totalPoints: int32;
  image: null | url;
  isActivityPublic: boolean;
  activities: {
    type: "socialtag" | "quiz" | "mission" | "walk" | "gps" | string;
    points: int32;
    activityId:
      | "socialtag"
      | "quiz"
      | "mission"
      | "walk"
      | "statistic_walk"
      | "statistic_run"
      | "active_walk"
      | "bike"
      | string;
    value: int32;
    title:
      | "statistic_socialtag"
      | "statistic_quiz"
      | "statistic_mission"
      | "statistic_active_walk"
      | "statistic_bike"
      | string;
    isHistoryEmpty: boolean;
  }[];
  isBoostable: boolean;
  boostedBy: string[];
  boostCount: int32;
  boostEndAt: utcDateTime[];
  isBlocked: boolean;
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
  user(): UserDetails;

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

  @route("/api/2.0/users")
  @get
  getAllUsers(): {
    id: string;
    firstName: string;
    lastName: string;
    isPublic: boolean;
    teamId: string;
    entityId: null;
    boostCount: int32;
    entityName: null;
    image: null | url;
  }[];

  @route("/api/2.0/users/{id}")
  @get
  getUser(@path("id") id: string): UserDetails;

  @route("/api/2.0/users/{id}/boost")
  @post
  boostUser(@path("id") id: string): unknown;

  @route("/api/2.0/users/{id}/statistics")
  @get
  getUserStatistics(@path("id") id: string): UserStatistics;
}

model SocialTag {
  id: string;
  remaining: int32;
  availability: "WEEKLY" | "DAILY" | string;
  occurrence: int32;
  points: int32;
  date: utcDateTime;
  image: url;
  name: string;
  description: string;
}

// Post can eb made with json or form data
// model SocialPostFormData {
//   @header contentType: "multipart/form-data";
//   message?: string;
//   socialtagId?: string;
//   @format("binary")
//   image?: string;
// }

@tag("Social")
interface Social {
  @route("/api/3.0/social/posts")
  @get
  posts(@query sincePostId?: string): SocialPost[];

  @route("/api/3.0/social/posts")
  @post
  createPost(
    @body body: {
      message: string;
    },
  ): SocialPost;

  // @route("/api/3.0/social/posts")
  // @post
  // createPostWithImage(...SocialPostFormData): unknown;

  @route("/api/3.0/social/posts/{post_id}/like")
  @put
  likePost(@path("post_id") postId: string): unknown;

  @route("/api/2.0/socialTags/list")
  @get
  getSocialTags(): {
    ongoing: SocialTag[];
    upcoming: SocialTag[];
  };
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

model MyChallenge {
  spaceImage: url;
  image: url;
  startAt: utcDateTime;
  endAt: utcDateTime;
  title: string;
  tagline: string;
  description: string;
  statistics: unknown;
  deletionDate: null | utcDateTime;
}

@tag("Challenge")
interface ChallengeService {
  @route("/api/3.0/my/challenge")
  @get
  myChallenge(): MyChallenge;
}
