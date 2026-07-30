import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure GlobalDiseaseBurdenPackage where
  incidenceRate : Prop
  mortalityRate : Prop
  disabilityAdjustedLifeYears : Prop
  yearsOfLifeLost : Prop
  yearsLivedWithDisability : Prop
  prevalenceRate : Prop
  attributableFraction : Prop

structure GlobalDiseaseBurdenEvidence (D : GlobalDiseaseBurdenPackage) where
  incidenceRateClosed : D.incidenceRate
  mortalityRateClosed : D.mortalityRate
  disabilityAdjustedLifeYearsClosed : D.disabilityAdjustedLifeYears
  yearsOfLifeLostClosed : D.yearsOfLifeLost
  yearsLivedWithDisabilityClosed : D.yearsLivedWithDisability
  prevalenceRateClosed : D.prevalenceRate
  attributableFractionClosed : D.attributableFraction

def GlobalDiseaseBurdenClosed (D : GlobalDiseaseBurdenPackage) : Prop :=
  D.incidenceRate ∧ D.mortalityRate ∧ D.disabilityAdjustedLifeYears ∧
  D.yearsOfLifeLost ∧ D.yearsLivedWithDisability ∧ D.prevalenceRate ∧ D.attributableFraction

theorem global_disease_burden_closed_from_evidence
    (D : GlobalDiseaseBurdenPackage) (E : GlobalDiseaseBurdenEvidence D) :
    GlobalDiseaseBurdenClosed D := by
  exact And.intro E.incidenceRateClosed
    (And.intro E.mortalityRateClosed
      (And.intro E.disabilityAdjustedLifeYearsClosed
        (And.intro E.yearsOfLifeLostClosed
          (And.intro E.yearsLivedWithDisabilityClosed
            (And.intro E.prevalenceRateClosed E.attributableFractionClosed)))))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse