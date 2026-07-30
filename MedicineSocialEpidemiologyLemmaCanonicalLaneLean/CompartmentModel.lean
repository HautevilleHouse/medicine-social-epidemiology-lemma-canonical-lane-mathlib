import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptible : Nat -> Prop
  infected : Nat -> Prop
  recovered : Nat -> Prop
  transmissionRate : Nat -> Nat
  recoveryRate : Nat -> Nat
  infectionIncidence : Prop
  recoveryIncidence : Prop
  totalPopulationConstant : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  infectionIncidenceClosed : C.infectionIncidence
  recoveryIncidenceClosed : C.recoveryIncidence
  totalPopulationConstantClosed : C.totalPopulationConstant

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.infectionIncidence ∧ C.recoveryIncidence ∧ C.totalPopulationConstant

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C :=
  And.intro E.infectionIncidenceClosed
    (And.intro E.recoveryIncidenceClosed E.totalPopulationConstantClosed)

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse