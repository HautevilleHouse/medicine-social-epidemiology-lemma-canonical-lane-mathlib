import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure SocialEpidemiologySocioeconomicStratifiers where
  incomeInequality : Prop
  educationAttainment : Prop
  housingQuality : Prop
  foodSecurity : Prop
  accessToHealthcare : Prop
  occupationalExposures : Prop
  healthDisparities : Prop

structure SocialEpidemiologyStratifierEvidence
    (S : SocialEpidemiologySocioeconomicStratifiers) where
  incomeInequalityClosed : S.incomeInequality
  educationAttainmentClosed : S.educationAttainment
  housingQualityClosed : S.housingQuality
  foodSecurityClosed : S.foodSecurity
  accessToHealthcareClosed : S.accessToHealthcare
  occupationalExposuresClosed : S.occupationalExposures
  healthDisparitiesClosed : S.healthDisparities

def SocialEpidemiologyStratifiersClosed
    (S : SocialEpidemiologySocioeconomicStratifiers) : Prop :=
  S.incomeInequality ∧ S.educationAttainment ∧ S.housingQuality ∧
  S.foodSecurity ∧ S.accessToHealthcare ∧ S.occupationalExposures ∧ S.healthDisparities

theorem social_epidemiology_stratifiers_closed_from_evidence
    (S : SocialEpidemiologySocioeconomicStratifiers)
    (E : SocialEpidemiologyStratifierEvidence S) :
    SocialEpidemiologyStratifiersClosed S := by
  exact And.intro E.incomeInequalityClosed
    (And.intro E.educationAttainmentClosed
      (And.intro E.housingQualityClosed
        (And.intro E.foodSecurityClosed
          (And.intro E.accessToHealthcareClosed
            (And.intro E.occupationalExposuresClosed E.healthDisparitiesClosed)))))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse