/*
 * All rights reserved ~ ©Phil Gengenbach
 */

/*
 * Challenge Class, includes all information of a challenge.
 *  - Title
 *  - Description
 */
class Challenge {

  final String title;
  final String challengeText;
  final int points;
  final int rating;

  // updated when challenge is randomly selected
  bool flagDaily;
  int timeStarted;
  int timeFinished;

  Challenge(this.title, this.challengeText, this.points, this.rating, this.flagDaily, this.timeStarted, this.timeFinished);

}