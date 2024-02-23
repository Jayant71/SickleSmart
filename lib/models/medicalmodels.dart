class Record {}

class Test {
  Test(
      {this.testType,
      this.testMethod,
      this.dateOfSampling,
      this.dateOfResult,
      this.testResult});
  var testType;
  var testMethod;
  var dateOfSampling;
  var dateOfResult;
  var testResult;
}

class Medications {
  Medications(
      {this.medicationName,
      this.medicationDose,
      this.medicationFrequency,
      this.medicationDuration,
      this.medicationStartDate,
      this.medicationEndDate});

  var medicationName;
  var medicationDose;
  var medicationFrequency;
  var medicationDuration;
  var medicationStartDate;
  var medicationEndDate;
}
