class JobModel {
  final int id;
  final String title;
  final String location;
  final String jobType;
  final int minSalary;
  final int maxSalary;
  final String salaryCurrency;
  final String companyName;
  final String? companyLogoUrl;

  JobModel({
    required this.id,
    required this.title,
    required this.location,
    required this.jobType,
    required this.minSalary,
    required this.maxSalary,
    required this.salaryCurrency,
    required this.companyName,
    this.companyLogoUrl,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    id: json["id"],
    title: json["title"],
    location: json["location"],
    jobType: json["jobType"],
    minSalary: json["minSalary"],
    maxSalary: json["maxSalary"],
    salaryCurrency: json["salaryCurrency"],
    companyName: json["companyName"],
    companyLogoUrl: json["companyLogoUrl"],
  );
}
