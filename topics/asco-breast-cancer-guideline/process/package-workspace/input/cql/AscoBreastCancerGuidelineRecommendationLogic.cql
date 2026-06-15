/*
  Library: AscoBreastCancerGuidelineRecommendationLogic
  Version: 1.0.0
  Purpose: Computable condition logic for ASCO neoadjuvant breast cancer recommendations.
  Model: FHIR R4 4.0.1
*/
library AscoBreastCancerGuidelineRecommendationLogic version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

valueset "InflammatoryBreastCancer": 'http://example.org/fhir/ValueSet/inflammatory-breast-cancer' version '1.0.0'
valueset "LocallyAdvancedBreastCancer": 'http://example.org/fhir/ValueSet/locally-advanced-breast-cancer' version '1.0.0'
valueset "TripleNegativeBreastCancer": 'http://example.org/fhir/ValueSet/triple-negative-breast-cancer' version '1.0.0'
valueset "Her2PositiveBreastCancer": 'http://example.org/fhir/ValueSet/her2-positive-breast-cancer' version '1.0.0'
valueset "HrPositiveHer2NegativeBreastCancer": 'http://example.org/fhir/ValueSet/hr-positive-her2-negative-breast-cancer' version '1.0.0'
valueset "PathologicCompleteResponse": 'http://example.org/fhir/ValueSet/pathologic-complete-response' version '1.0.0'
valueset "ResidualDisease": 'http://example.org/fhir/ValueSet/residual-disease' version '1.0.0'

parameter "ResidualDiseaseWouldChangeAdjuvantTherapyInput" Boolean default false
parameter "DownstagingGoalInput" Boolean default false
parameter "SurgeryDelayContextInput" Boolean default false
parameter "StandardTumorFeaturesAvailableInput" Boolean default true
parameter "TnbcNodePositiveOrAtLeastT1cInput" Boolean default false
parameter "TnbcCt1aOrCt1bN0Input" Boolean default false
parameter "BenefitHarmFavorsCarboplatinInput" Boolean default false
parameter "ChemotherapyDecisionWithoutSurgicalDataInput" Boolean default false
parameter "PatientIsPostmenopausalInput" Boolean default false
parameter "NoSurgeryIntendedInput" Boolean default false
parameter "PatientIsPremenopausalInput" Boolean default false
parameter "Her2PositiveHighRiskInput" Boolean default false
parameter "Her2PositiveT1aOrT1bN0Input" Boolean default false

context Patient

define "Inflammatory Breast Cancer Conditions":
  [Condition: "InflammatoryBreastCancer"]

define "Locally Advanced Breast Cancer Conditions":
  [Condition: "LocallyAdvancedBreastCancer"]

define "Triple-negative Breast Cancer Conditions":
  [Condition: "TripleNegativeBreastCancer"]

define "HER2-positive Breast Cancer Conditions":
  [Condition: "Her2PositiveBreastCancer"]

define "HR-positive HER2-negative Breast Cancer Conditions":
  [Condition: "HrPositiveHer2NegativeBreastCancer"]

define "Residual Disease Findings":
  [Observation: "ResidualDisease"]

define "Pathologic Complete Response Findings":
  [Observation: "PathologicCompleteResponse"]

define "Any Managed Breast Cancer Subtype":
  exists("Inflammatory Breast Cancer Conditions")
    or exists("Locally Advanced Breast Cancer Conditions")
    or exists("Triple-negative Breast Cancer Conditions")
    or exists("HER2-positive Breast Cancer Conditions")
    or exists("HR-positive HER2-negative Breast Cancer Conditions")

define "InflammatoryOrLocallyAdvancedUnresectableDisease":
  exists("Inflammatory Breast Cancer Conditions")
    or exists("Locally Advanced Breast Cancer Conditions")

define "ResidualDiseaseResultWouldChangeAdjuvantTherapy":
  "ResidualDiseaseWouldChangeAdjuvantTherapyInput"
    or exists("Residual Disease Findings")

define "DownstagingOrSurgeryExtentReductionIsATreatmentGoal":
  "DownstagingGoalInput"

define "SurgeryDelayIsPreferableOrUnavoidable":
  "SurgeryDelayContextInput"

define "HistologyGradeStageAndErPrHer2AreAvailable":
  "StandardTumorFeaturesAvailableInput"
    and "Any Managed Breast Cancer Subtype"

define "TnbcIsNodePositiveOrAtLeastT1c":
  exists("Triple-negative Breast Cancer Conditions")
    and "TnbcNodePositiveOrAtLeastT1cInput"

define "TnbcIsCt1aOrCt1bN0":
  exists("Triple-negative Breast Cancer Conditions")
    and "TnbcCt1aOrCt1bN0Input"

define "BenefitHarmBalanceFavorsCarboplatin":
  "BenefitHarmFavorsCarboplatinInput"

define "HrPositiveHer2NegativeSubtype":
  exists("HR-positive HER2-negative Breast Cancer Conditions")

define "ChemotherapyDecisionCanBeMadeWithoutSurgicalPathologyOrGenomicTesting":
  "ChemotherapyDecisionWithoutSurgicalDataInput"

define "PatientIsPostmenopausal":
  "PatientIsPostmenopausalInput"

define "NoSurgeryIsIntended":
  "NoSurgeryIntendedInput"

define "PatientIsPremenopausal":
  "PatientIsPremenopausalInput"

define "Her2PositiveWithNodePositiveOrHighRiskNodeNegativeDisease":
  exists("HER2-positive Breast Cancer Conditions")
    and "Her2PositiveHighRiskInput"

define "Her2PositiveT1aOrT1bN0Disease":
  exists("HER2-positive Breast Cancer Conditions")
    and "Her2PositiveT1aOrT1bN0Input"
