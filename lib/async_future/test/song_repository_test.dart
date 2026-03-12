
void main() async {
  //   Instantiate the  song_repository_mock
  SongRepositoryMock songRepositoryMock = SongRepositoryMock();

  // Test both the success and the failure of the post request
  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // - Using async/await with try/catch.
}
