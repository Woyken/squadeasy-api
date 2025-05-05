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
    refreshToken(
        @header("Authorization") authorization: string,
        @header("Refresh-Token") refreshToken: string,
    ): TokenRemoteEntity;

    @route("3.0/auth/register")
    @post
    register(
        @body registerRemoteEntity: RegisterRemoteEntity,
    ): TokenRemoteEntity;

    @useAuth(NoAuth)
    @route("3.0/auth/login")
    @post
    login(@body login: Login): TokenRemoteEntity;

    @route("2.0/auth/forgot-password")
    @post
    forgotPassword(
        @body forgotPasswordRemoteEntity: ForgotPasswordRemoteEntity,
    ): void;

    @route("2.0/users/validate-account/code")
    @post
    validateAccountCode(
        @body emailConfirmationRemoteEntity: EmailConfirmationRemoteEntity,
    ): void;

    @route("2.0/users/validate-account/send-email")
    @post
    sendAccountValidationEmail(): EmailConfirmationRemoteEntity;

    @route("3.0/onboarding/discover")
    @get
    getOnboardingDiscover(): OnBoardingDiscoverRemoteEntity[];
}
