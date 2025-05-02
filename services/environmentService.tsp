import "@typespec/http";
using Http;

namespace SquadEasyApi;

model FitbitAuthRemoteEntity {
    access_token: string;
    refresh_token: string;
    expires_in: int32;
}

// @Json(name = "code") @NotNull String code
model SpaceCodeBodyRemoteEntity {
    code: string;
}

// @Json(name = "registrationType") @NotNull String registrationType, @Json(name = "isSocialWallEnabled") @Nullable Boolean bool, @Json(name = "isSocialtagEnabled") @Nullable Boolean bool2, @Json(name = "isBlogEnabled") @Nullable Boolean bool3, @Json(name = "isItineraryEnabled") @Nullable Boolean bool4, @Json(name = "isAnalyticsEnabled") @Nullable Boolean bool5, @Json(name = "isUserClassificationEnabled") @Nullable Boolean bool6
model SettingsFeaturesRemoteEntity {
    registrationType: string;
    isSocialWallEnabled?: boolean;
    isSocialtagEnabled?: boolean;
    isBlogEnabled?: boolean;
    isItineraryEnabled?: boolean;
    isAnalyticsEnabled?: boolean;
    isUserClassificationEnabled?: boolean;
}
// @Json(name = "primary") @NotNull String primary, @Json(name = "onPrimary") @NotNull String onPrimary, @Json(name = "secondary") @NotNull String secondary, @Json(name = "onSecondary") @NotNull String onSecondary, @Json(name = "textLight") @NotNull String textLight, @Json(name = "textDark") @NotNull String textDark, @Json(name = "background") @NotNull String background, @Json(name = "onBackground") @NotNull String onBackground, @Json(name = "alert") @NotNull String alert, @Json(name = "onAlert") @NotNull String onAlert
model SettingsThemeColorsRemoteEntity {
    primary: string;
    onPrimary: string;
    secondary: string;
    onSecondary: string;
    textLight: string;
    textDark: string;
    background: string;
    onBackground: string;
    alert: string;
    onAlert: string;
}

// @Json(name = "small") int i2, @Json(name = "medium") int i3
model SettingsThemeRadiusRemoteEntity {
    small: int32;
    medium: int32;
}

// @Json(name = "iconPackName") @Nullable String str, @Json(name = "appIconUrl") @Nullable String str2, @Json(name = "customFont") @Nullable String str3, @Json(name = "splashScreenUrl") @Nullable String str4, @Json(name = "mascotUrl") @Nullable String str5
model SettingsThemeAssetsRemoteEntity {
    iconPackName?: string;
    appIconUrl?: string;
    customFont?: string;
    splashScreenUrl?: string;
    mascotUrl?: string;
}

// @Json(name = "colors") @NotNull SettingsThemeColorsRemoteEntity colors, @Json(name = "radius") @NotNull SettingsThemeRadiusRemoteEntity radius, @Json(name = "assets") @NotNull SettingsThemeAssetsRemoteEntity assets
model SettingsThemeRemoteEntity {
    colors: SettingsThemeColorsRemoteEntity;
    radius: SettingsThemeRadiusRemoteEntity;
    assets: SettingsThemeAssetsRemoteEntity;
}

// @Json(name = "faq") @Nullable String str, @Json(name = "cgu") @Nullable String str2, @Json(name = "privacy") @Nullable String str3
model SettingsLinksRemoteEntity {
    faq?: string;
    cgu?: string;
    privacy?: string;
}

// @Json(name = "duration") int i2, @Json(name = "percentage") int i3, @Json(name = "max") int i4
model SettingsBoostsRemoteEntity {
    duration: int32;
    percentage: int32;
    max: int32;
}

// @Json(name = "spaceId") @Nullable String str, @Json(name = "email") @NotNull String email, @Json(name = "name") @NotNull String name, @Json(name = "isZendeskEnabled") boolean z
model SettingsSupportRemoteEntity {
    spaceId?: string;
    email: string;
    name: string;
    isZendeskEnabled: boolean;
}

// @Json(name = "maxMembers") int i2, @Json(name = "canCreate") boolean z
model SettingsTeamRemoteEntity {
    maxMembers: int32;
    canCreate: boolean;
}

// @Json(name = "id") @NotNull String id, @Json(name = "features") @NotNull SettingsFeaturesRemoteEntity features, @Json(name = "theme") @NotNull SettingsThemeRemoteEntity theme, @Json(name = "links") @NotNull SettingsLinksRemoteEntity links, @Json(name = "boosts") @NotNull SettingsBoostsRemoteEntity boosts, @Json(name = "support") @NotNull SettingsSupportRemoteEntity support, @Json(name = "team") @NotNull SettingsTeamRemoteEntity team
model SettingsRemoteEntity {
    id: string;
    features: SettingsFeaturesRemoteEntity;
    theme: SettingsThemeRemoteEntity;
    links: SettingsLinksRemoteEntity;
    boosts: SettingsBoostsRemoteEntity;
    support: SettingsSupportRemoteEntity;
    team: SettingsTeamRemoteEntity;
}

// @Json(name = "id") @NotNull String id, @Json(name = "name") @NotNull String name
model GroupRemoteEntity {
    id: string;
    name: string;
}

// @Json(name = "languageCode") @NotNull String code, @Json(name = "languageName") @NotNull String name
model LanguageRemoteEntity {
    languageCode: string;
    languageName: string;
}

@tag("Environment")
@route("api")
interface EnvironmentService {
    @route("2.0/landing/spaces/validate")
    @post
    postTODO2_0_landing_spaces_validate(
        @body spaceCodeBodyRemoteEntity: SpaceCodeBodyRemoteEntity,
    ): IdRemoteEntity;

    @route("3.0/settings{?id}")
    @get
    getTODO3_0_settings(
        @header("Cache-Control") cacheControl: string,
        @query id?: string,
    ): SettingsRemoteEntity;

    @route("2.0/entities/{spaceId}")
    @get
    getTODO2_0_entities__spaceId_(@path spaceId: string): GroupRemoteEntity[];

    @route("2.0/languages")
    @get
    getTODO2_0_languages(): LanguageRemoteEntity[];
}
