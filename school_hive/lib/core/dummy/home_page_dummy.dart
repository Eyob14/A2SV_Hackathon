import '../../features/issue/domain/entities/Issue.dart';
import '../../features/issue/domain/entities/comment.dart';
import '../../features/profile/domain/entities/Profile.dart';
import '../utils/image_urls.dart';

List<Issue> issueList = [
  Issue(
    id: "1",
    title: "Join Hackathon competition prepared for all African students",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    archives: const [],
    tags: const [],
    isFavorite: false,
    profile: Profile(
      avatar: profileImage,
      bio: 'I am a 4th year software engineering student',
      country: "Ethiopia",
      createdAt: DateTime.now(),
      email: "eyobzebene3580@gmail.com",
      favoriteTags: [],
      id: "1",
      name: "Eyob Zebene",
      userName: "Nzret",
    ),
  ),
  Issue(
    id: "3",
    title: "Join Hackathon competition prepared for all African students",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    archives: [],
    tags: [],
    isFavorite: false,
    profile: Profile(
      avatar: profileImage,
      bio: 'I am a 4th year software engineering student',
      country: "Ethiopia",
      createdAt: DateTime.now(),
      email: "eyobzebene3580@gmail.com",
      favoriteTags: [],
      id: "3",
      name: "Eyob Zebene",
      userName: "Nzret",
    ),
  ),
  Issue(
    id: "2",
    title: "Join Hackathon competition prepared for all African students",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    archives: [],
    tags: [],
    isFavorite: false,
    profile: Profile(
      avatar: profileImage,
      bio: 'I am a 4th year software engineering student',
      country: "Ethiopia",
      createdAt: DateTime.now(),
      email: "eyobzebene3580@gmail.com",
      favoriteTags: [],
      id: "2",
      name: "Eyob Zebene",
      userName: "Nzret",
    ),
  ),
];

List<Comment> comments = [
  Comment(
    id: "1",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    upVotes: 120,
    downVotes: 3,
    time: DateTime.now(),
  ),
  Comment(
    id: "2",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    upVotes: 120,
    downVotes: 3,
    time: DateTime.now(),
  ),
  Comment(
    id: "3",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    upVotes: 120,
    downVotes: 3,
    time: DateTime.now(),
  ),
];
