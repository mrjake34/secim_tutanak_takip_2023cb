class BallotBoxes {
  int? ballotBoxNumber;
  CmResult? cmResult;
  CmResult? mvResult;
  String? schoolName;

  BallotBoxes(
      {this.ballotBoxNumber, this.cmResult, this.mvResult, this.schoolName});

  BallotBoxes.fromJson(Map<String, dynamic> json) {
    ballotBoxNumber = json['ballot_box_number'];
    cmResult =
        json['cm_result'] != null ? CmResult.fromJson(json['cm_result']) : null;
    mvResult =
        json['mv_result'] != null ? CmResult.fromJson(json['mv_result']) : null;
    schoolName = json['school_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ballot_box_number'] = ballotBoxNumber;
    if (cmResult != null) {
      data['cm_result'] = cmResult!.toJson();
    }
    if (mvResult != null) {
      data['mv_result'] = mvResult!.toJson();
    }
    data['school_name'] = schoolName;
    return data;
  }
}

class CmResult {
  String? imageUrl;
  int? submissionId;
  int? totalVote;
  Votes? votes;

  CmResult({this.imageUrl, this.submissionId, this.totalVote, this.votes});

  CmResult.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    submissionId = json['submission_id'];
    totalVote = json['total_vote'];
    votes = json['votes'] != null ? Votes.fromJson(json['votes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['submission_id'] = submissionId;
    data['total_vote'] = totalVote;
    if (votes != null) {
      data['votes'] = votes!.toJson();
    }
    return data;
  }
}

class Votes {
  int? i1;
  int? i2;

  Votes({
    this.i1,
    this.i2,
  });

  Votes.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;

    return data;
  }
}

// class Votes {
//   int? i5;
//   int? i6;
//   int? i8;
//   int? i9;
//   int? i11;
//   int? i12;
//   int? i13;
//   int? i20;
//   int? i21;
//   int? i22;
//   int? i23;

//   Votes(
//       {this.i5,
//       this.i6,
//       this.i8,
//       this.i9,
//       this.i11,
//       this.i12,
//       this.i13,
//       this.i20,
//       this.i21,
//       this.i22,
//       this.i23});

//   Votes.fromJson(Map<String, dynamic> json) {
//     i5 = json['5'];
//     i6 = json['6'];
//     i8 = json['8'];
//     i9 = json['9'];
//     i11 = json['11'];
//     i12 = json['12'];
//     i13 = json['13'];
//     i20 = json['20'];
//     i21 = json['21'];
//     i22 = json['22'];
//     i23 = json['23'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['5'] = this.i5;
//     data['6'] = this.i6;
//     data['8'] = this.i8;
//     data['9'] = this.i9;
//     data['11'] = this.i11;
//     data['12'] = this.i12;
//     data['13'] = this.i13;
//     data['20'] = this.i20;
//     data['21'] = this.i21;
//     data['22'] = this.i22;
//     data['23'] = this.i23;
//     return data;
//   }
// }
