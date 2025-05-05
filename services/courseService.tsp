import "@typespec/http";
using Http;

namespace SquadEasyApi;

// @Json(name = "points") @NotNull List<? extends List<Double>> points, @Json(name = "difficulties") @NotNull List<Integer> difficulties, @Json(name = "sources") @NotNull List<String> sources
model SearchCourseBodyRemoteEntity {
    points: float64[];
    difficulties: int32[];
    sources: string[];
}

// @Json(name = "coordinates") @NotNull List<Double> coordinates, @Json(name = "source") @NotNull String source, @Json(name = "type") @NotNull String type, @Json(name = "title") @Nullable String str, @Json(name = "description") @Nullable String str2, @Json(name = "polyline") @Nullable String str3, @Json(name = "difficulty") @Nullable Integer num, @Json(name = "duration") @Nullable Integer num2, @Json(name = "distance") @Nullable Double d2
model CourseRemoteEntity {
    coordinates: float64[];
    source: string;
    type: string;
    title?: string;
    description?: string;
    polyline?: string;
    difficulty?: int32;
    duration?: int32;
    distance?: float64;
}

// @Json(name = "id") @NotNull String id, @Json(name = "activityType") @NotNull String activityType, @Json(name = "difficulty") int i2, @Json(name = "title") @NotNull String title, @Json(name = "description") @NotNull String description
model SubmitCourseBodyRemoteEntity {
    id: string;
    activityType: string;
    difficulty: int32;
    title: string;
    description: string;
}

@tag("Course")
@route("api")
interface CourseService {
    @route("2.0/courses/search")
    @post
    searchCourses(
        @body searchCourseBodyRemoteEntity: SearchCourseBodyRemoteEntity,
    ): CourseRemoteEntity[];

    @route("2.0/my/courses")
    @post
    submitMyCourse(
        @body submitCourseBodyRemoteEntity: SubmitCourseBodyRemoteEntity,
    ): void;

    @route("2.0/courses/sources")
    @get
    getCourseSources(): string[];
}
