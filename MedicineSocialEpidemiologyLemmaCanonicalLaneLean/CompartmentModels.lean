import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.MedicineSocialEpidemiologyLemmaCanonicalLaneLean

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  populationSize : ℕ
  compartments : List String
  transitionRates : ℕ → ℕ → ℝ

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  populationSizeClosed : M.populationSize > 0
  compartmentsClosed : M.compartments ≠ []
  transitionRatesClosed : ∀ i j, M.transitionRates i j ≥ 0

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.populationSize > 0 ∧ M.compartments ≠ [] ∧ ∀ i j, M.transitionRates i j ≥ 0

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage) (E : CompartmentModelEvidence M) :
    CompartmentModelClosed M := by
  exact And.intro E.populationSizeClosed (And.intro E.compartmentsClosed E.transitionRatesClosed)

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse