import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : EpidemiologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EpidemiologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
