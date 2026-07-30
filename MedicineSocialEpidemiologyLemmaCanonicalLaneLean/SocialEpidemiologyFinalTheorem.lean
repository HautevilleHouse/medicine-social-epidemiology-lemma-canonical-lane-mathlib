import canonicalLaneMathlib.AdmissibleClass
import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.BridgeLemmas
import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

def ConstrainedMedicineSocialEpidemiologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_medicine_social_epidemiology_endgame (A : AdmissibleClass) :
    ConstrainedMedicineSocialEpidemiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse