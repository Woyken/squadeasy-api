import "@typespec/http";

import "./services/activityService.tsp";
import "./services/analyticsService.tsp";
import "./services/authService.tsp";
import "./services/challengeService.tsp";
import "./services/chatService.tsp";
import "./services/co2Service.tsp";
import "./services/courseService.tsp";
import "./services/environmentService.tsp";
import "./services/homeService.tsp";
import "./services/mainService.tsp";
import "./services/msService.tsp";
import "./services/notificationService.tsp";
import "./services/rankingService.tsp";
import "./services/socialWallService.tsp";
import "./services/sportService.tsp";
import "./services/teamService.tsp";
import "./services/tutorialsService.tsp";
import "./services/userService.tsp";
import "./services/weatherService.tsp";

using Http;
@doc("""
  SquadEasy API
  
  Reverse engineered API from SquadEasy app (`co.livehappier.squadV2`)
  
  Repo: <https://github.com/Woyken/squadeasy-api>
  
  Main api document:
  <https://woyken.github.io/squadeasy-api>
  
  Microservices api document:
  <https://woyken.github.io/squadeasy-api/microservice-api>
  
  Authorization flow:
  
  `POST /api/3.0/auth/login` with email and password, returns accessToken and refreshToken
  
  `POST /api/3.0/auth/refresh-token` to refresh token after it expires
  
  All other endpoints will require accessToken in Authorization header
  """)
@server("https://api-challenge.squadeasy.com", "API endpoint")
@service(#{ title: "SquadEasy API" })
@useAuth(BearerAuth)
namespace SquadEasyApi;
