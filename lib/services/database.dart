/*
 * All rights reserved ~ ©Phil Gengenbach
 */

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plantit/models/challenge.dart';

class DataBaseService {

  final String uid;

  DataBaseService({this.uid});

  // Data Stored of Each User
  final CollectionReference plantCollection = Firestore.instance.collection("plants"); // USER DATA
  final CollectionReference missionCollection = Firestore.instance.collection("missions"); // MISSION DATA

  DocumentReference getUserDocument() {
    return plantCollection.document(uid);
  }

  // Creates a new user and assigns user name and initial score to it.
  Future<void> createUser(String username, int score) async {
    // setData creates document if not existing
    await getUserDocument().setData({
      'username': username,
      'score': score,
    });
  }

  // Assigns a new score to a User
  Future<void> updateUserScore(int score) async {
    await getUserDocument().updateData({
      'score': score,
    });
  }


  // determines the current score of an User
  Future<int> getUserScore() async {
    DocumentSnapshot documentSnapshot = await getUserDocument().get();
    return documentSnapshot['score'];
  }

  //returns the challenge information as a Map (Convertion)
  Map<String, dynamic> challengeToMap(Challenge challenge) {
    if (challenge == null) {
      return null;
    } else {
      return {
        'title': challenge.title,
        'description': challenge.challengeText,
        'points': challenge.points,
        'rating': challenge.rating,
        'daily_flag': challenge.flagDaily,
        'starting_date': challenge.timeStarted,
        'finished_date': challenge.timeFinished
      };
    }
  }

  // creates Challenge object from database document
  Challenge createChallenge(Map snapshot) {
    if (snapshot == null) {
      return null;
    }

    String title = snapshot['title'];
    String description = snapshot['description'];
    int points = snapshot['points'];
    int rating = snapshot['rating'];
    bool flagDaily = snapshot['daily_flag'];
    int timeStarted = snapshot['starting_date'];
    int timeFinished = snapshot['finished_date'];

    return Challenge(title, description, points, rating, flagDaily, timeStarted, timeFinished);
  }

  //QuerySnapshot represents a Collection
  List<Challenge> createChallengeList(QuerySnapshot querySnapshot) {
    List<Challenge> challengeList = new List<Challenge>();

    querySnapshot.documents.forEach((documentSnapshot) {
      Challenge challenge = createChallenge(documentSnapshot.data);
      if (challenge != null) {
        challengeList.add(challenge);
      }
    });

    return challengeList;
  }

  // Adds a new Completed Challenge to the Mission History
  Future addHistoryEntry(Challenge challenge) async {
    if (challenge == null) {
      return;
    }

    getUserDocument().collection("history").add(challengeToMap(challenge));
  }

  // Returns all completed missions of an user as a List
  Future<List<Challenge>> getHistoryEntries() async {
    QuerySnapshot querySnapshot = await getUserDocument().collection('history').getDocuments();
    return createChallengeList(querySnapshot);
  }

  //Sets the active DailyMission as Map inside User Document
  Future<void> setActiveDailyChallenge(Challenge challenge) async {
    await getUserDocument().updateData({
      'active_daily': challengeToMap(challenge)
    });
  }

  //Sets the active NonDailyMission as Map inside User Document
  Future<void> setActiveNondailyChallenge(Challenge challenge) async {
    await getUserDocument().updateData({
      'active_nondaily': challengeToMap(challenge)
    });
  }

  //Returns current active Daily Challenge inside Firebase User Document
  Future<Challenge> getActiveDailyChallenge() async {
    DocumentSnapshot snapshot = await getUserDocument().get();
    return createChallenge(snapshot['active_daily']);
  }

  //Returns current active NonDaily Challenge inside Firebase User Document
  Future<Challenge> getActiveNondailyChallenge() async {
    DocumentSnapshot snapshot = await getUserDocument().get();
    return createChallenge(snapshot['active_nondaily']);
  }

  Future<void> updateActiveChallenges() async {
    Challenge currentDailyChallenge = await getActiveDailyChallenge();
    Challenge currentNondailyChallenge = await getActiveNondailyChallenge();

    // load available challenges
    QuerySnapshot querySnapshot = await missionCollection.getDocuments();
    List<Challenge> availableChallenges = createChallengeList(querySnapshot);

    // select new random challenge indexes
    int countChallenges = availableChallenges.length;
    Random random = new Random();
    int indexDailyChallenge = random.nextInt(countChallenges);
    int indexNondailyChallenge = random.nextInt(countChallenges);

    //Debug Messages
    print({
      'available': countChallenges,
      'daily': indexDailyChallenge,
      'nondaily': indexNondailyChallenge
    });

    // create daily challenge
    int currentTimestamp = new DateTime.now().millisecondsSinceEpoch;
    Challenge randomDailyChallenge = availableChallenges[indexDailyChallenge];
    randomDailyChallenge.flagDaily = true;
    randomDailyChallenge.timeStarted = currentTimestamp;

    // set daily challenge if nescessary (if not existent or expired)
    if (currentDailyChallenge == null) {
      setActiveDailyChallenge(randomDailyChallenge);
    } else if (currentDailyChallenge.timeStarted <= (currentTimestamp - 24 * 60 * 60 * 1000)) { // one day in milliseconds
      // Challenge is expired after one day -> overwrite old challenge, do not copy to history
      setActiveDailyChallenge(randomDailyChallenge);
    }

    // create nondaily challenge
    Challenge randomNondailyChallenge = availableChallenges[indexNondailyChallenge];
    randomNondailyChallenge.flagDaily = false;
    randomNondailyChallenge.timeStarted = currentTimestamp;

    // set nondaily challenge if nescessary (if not existent)
    if (currentNondailyChallenge == null) {
      setActiveNondailyChallenge(randomNondailyChallenge);
    }
  }

}