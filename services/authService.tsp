import "@typespec/http";
using Http;

namespace SquadEasyApi;

model TokenRemoteEntity {
    accessToken: string;
    refreshToken: string;
}

model RegisterRemoteEntity {
    email: string;
    password: string;
    passwordConfirmation: string;
    firstName: string;
    lastName: string;
    spaceId: string;

    @doc("groupId")
    entity?: string;

    languageCode: string;
    isPublic: boolean;
    consentBasics: boolean;
    consentDataShare: boolean;
}

model Login {
    email: string;
    password: string;
}

model ForgotPasswordRemoteEntity {
    email: string;
}

model EmailConfirmationRemoteEntity {
    code?: string;
    email?: string;
}

model OnBoardingDiscoverRemoteEntity {
    image?: string;
    title?: string;
    description?: string;
}

@tag("Auth")
@route("api")
interface AuthService {
    @route("3.0/auth/refresh-token")
    @post
    postTODO3_0_auth_refresh_token(
        @header("Authorization") authorization: string,
        @header("Refresh-Token") refreshToken: string,
    ): TokenRemoteEntity;

    @route("3.0/auth/register")
    @post
    postTODO3_0_auth_register(
        @body registerRemoteEntity: RegisterRemoteEntity,
    ): TokenRemoteEntity;

    @useAuth(NoAuth)
    @route("3.0/auth/login")
    @post
    postTODO3_0_auth_login(@body login: Login): TokenRemoteEntity;

    @route("2.0/auth/forgot-password")
    @post
    postTODO2_0_auth_forgot_password(
        @body forgotPasswordRemoteEntity: ForgotPasswordRemoteEntity,
    ): void;

    @route("2.0/users/validate-account/code")
    @post
    postTODO2_0_users_validate_account_code(
        @body emailConfirmationRemoteEntity: EmailConfirmationRemoteEntity,
    ): void;

    @route("2.0/users/validate-account/send-email")
    @post
    postTODO2_0_users_validate_account_send_email(
    ): EmailConfirmationRemoteEntity;

    @route("3.0/onboarding/discover")
    @get
    getTODO3_0_onboarding_discover(): OnBoardingDiscoverRemoteEntity[];
}
