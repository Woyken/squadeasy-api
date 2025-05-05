import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "selected") @Nullable String str, @Json(name = "unSelected") @Nullable String str2
model BottomBarColorsRemoteEntity {
    selected?: string;
    unSelected?: string;
}

// @Json(name = "name") @NotNull String name, @Json(name = "params") @Nullable Map<String, String> map
model CommandRemoteEntity {
    name: string;
    params?: Record<string>;
}

// @Json(name = "iconSelected") @NotNull String iconSelected, @Json(name = "iconUnselected") @NotNull String iconUnselected, @Json(name = "titleLocalised") @NotNull String titleLocalised, @Json(name = "command") @NotNull CommandRemoteEntity command, @Json(name = "isSpecial") boolean z, @Json(name = "isDefault") boolean z2, @Json(name = "badgeCount") @Nullable Integer num
model BottomBarTabRemoteEntity {
    iconSelected: string;
    iconUnselected: string;
    titleLocalised: string;
    command: CommandRemoteEntity;
    isSpecial: boolean;
    isDefault: boolean;
    badgeCount?: int32;
}

// @Json(name = "colors") @NotNull BottomBarColorsRemoteEntity colors, @Json(name = "tabs") @NotNull List<BottomBarTabRemoteEntity> tabs
model BottomBarRemoteEntity {
    colors: BottomBarColorsRemoteEntity;
    tabs: BottomBarTabRemoteEntity[];
}

@tag("Main")
@route("api")
interface MainService {
    @sharedRoute
    @route("3.0/bottom-nav{?socialWallSinceDate,chatSinceDate}")
    @get
    getBottomNav(
        @query socialWallSinceDate: string,
        @query chatSinceDate: string,
    ): BottomBarRemoteEntity;

    @route("2.0/rating/store/accept")
    @post
    acceptStoreRating(): void;

    @route("2.0/rating/store/decline")
    @post
    declineStoreRating(): void;

    @sharedRoute
    @route("3.0/bottom-nav")
    @get
    getBottomNavNoParams(): BottomBarRemoteEntity;
}
