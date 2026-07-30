import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure SurvivalAnalysisPackage where
  timeToEvent : Type
  hazardFunction : timeToEvent -> Prop
  survivalFunction : timeToEvent -> Prop
  proportionalHazards : Prop
  censoringMechanism : Prop
  logRankTest : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  proportionalHazardsClosed : S.proportionalHazards
  censoringMechanismClosed : S.censoringMechanism
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.proportionalHazards ∧
  S.censoringMechanism ∧ S.logRankTest

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S :=
  And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.proportionalHazardsClosed
        (And.intro E.censoringMechanismClosed E.logRankTestClosed)))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse