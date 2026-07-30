import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure DiseaseSpreadCompartmentModel where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  susceptibleDynamics : Prop
  infectedDynamics : Prop
  recoveredDynamics : Prop
  basicReproductiveNumber : Prop
  endemicEquilibrium : Prop

structure DiseaseSpreadCompartmentEvidence (M : DiseaseSpreadCompartmentModel) where
  susceptibleDynamicsClosed : M.susceptibleDynamics
  infectedDynamicsClosed : M.infectedDynamics
  recoveredDynamicsClosed : M.recoveredDynamics
  basicReproductiveNumberClosed : M.basicReproductiveNumber
  endemicEquilibriumClosed : M.endemicEquilibrium

def DiseaseSpreadCompartmentClosed (M : DiseaseSpreadCompartmentModel) : Prop :=
  M.susceptibleDynamics ∧ M.infectedDynamics ∧ M.recoveredDynamics ∧
  M.basicReproductiveNumber ∧ M.endemicEquilibrium

theorem disease_spread_compartment_closed_from_evidence
    (M : DiseaseSpreadCompartmentModel) (E : DiseaseSpreadCompartmentEvidence M) :
    DiseaseSpreadCompartmentClosed M := by
  exact And.intro E.susceptibleDynamicsClosed
    (And.intro E.infectedDynamicsClosed
      (And.intro E.recoveredDynamicsClosed
        (And.intro E.basicReproductiveNumberClosed E.endemicEquilibriumClosed)))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse