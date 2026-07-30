import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.CompartmentModels

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticPackage {M : CompartmentModelPackage} where
  drugDose : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  distributionVolume : ℝ

structure PharmacokineticEvidence {M : CompartmentModelPackage} (P : PharmacokineticPackage M) where
  drugDoseClosed : P.drugDose > 0
  absorptionRateClosed : P.absorptionRate > 0
  eliminationRateClosed : P.eliminationRate > 0
  distributionVolumeClosed : P.distributionVolume > 0

def PharmacokineticClosed {M : CompartmentModelPackage} (P : PharmacokineticPackage M) : Prop :=
  P.drugDose > 0 ∧ P.absorptionRate > 0 ∧ P.eliminationRate > 0 ∧ P.distributionVolume > 0

theorem pharmacokinetic_closed_from_evidence {M : CompartmentModelPackage} (P : PharmacokineticPackage M) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.drugDoseClosed (And.intro E.absorptionRateClosed (And.intro E.eliminationRateClosed E.distributionVolumeClosed))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse