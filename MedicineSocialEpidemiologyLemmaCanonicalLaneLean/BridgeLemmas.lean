import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EpidemiologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
