import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure SurvivalAnalysisPackage where
  survivalFunction : Prop
  hazardFunction : Prop
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop
  rightCensoring : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  survivalFunctionClosed : S.survivalFunction
  hazardFunctionClosed : S.hazardFunction
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest
  rightCensoringClosed : S.rightCensoring

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.survivalFunction ∧ S.hazardFunction ∧ S.kaplanMeierEstimator ∧
  S.coxProportionalHazards ∧ S.logRankTest ∧ S.rightCensoring

theorem survival_analysis_closed_from_evidence
    (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.survivalFunctionClosed
    (And.intro E.hazardFunctionClosed
      (And.intro E.kaplanMeierEstimatorClosed
        (And.intro E.coxProportionalHazardsClosed
          (And.intro E.logRankTestClosed E.rightCensoringClosed))))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse