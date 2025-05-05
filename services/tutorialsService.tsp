import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "image") @Nullable String str, @Json(name = "title") @Nullable String str2, @Json(name = "description") @Nullable String str3, @Json(name = "buttonTitle") @Nullable String str4
model TutorialRemoteEntity {
    image?: string;
    title?: string;
    description?: string;
    buttonTitle?: string;
}

@tag("Tutorials")
@route("api")
interface TutorialsService {
    @route("3.0/tutorials/{helpId}")
    @get
    getTutorials(@path helpId: string): TutorialRemoteEntity[];
}
