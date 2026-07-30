import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure SocialDeterminantsPackage where
  socioeconomicStatus : Type u
  accessToCare : Prop
  healthBehavior : Prop
  environmentalExposure : Prop
  structuralInequality : Prop
  healthOutcomeDisparity : Prop

structure SocialDeterminantsEvidence (S : SocialDeterminantsPackage) where
  socioeconomicStatusClosed : S.socioeconomicStatus
  accessToCareClosed : S.accessToCare
  healthBehaviorClosed : S.healthBehavior
  environmentalExposureClosed : S.environmentalExposure
  structuralInequalityClosed : S.structuralInequality
  healthOutcomeDisparityClosed : S.healthOutcomeDisparity

def SocialDeterminantsClosed (S : SocialDeterminantsPackage) : Prop :=
  S.socioeconomicStatus ∧ S.accessToCare ∧ S.healthBehavior ∧
  S.environmentalExposure ∧ S.structuralInequality ∧ S.healthOutcomeDisparity

theorem social_determinants_closed_from_evidence (S : SocialDeterminantsPackage)
    (E : SocialDeterminantsEvidence S) : SocialDeterminantsClosed S := by
  exact And.intro E.socioeconomicStatusClosed
    (And.intro E.accessToCareClosed
      (And.intro E.healthBehaviorClosed
        (And.intro E.environmentalExposureClosed
          (And.intro E.structuralInequalityClosed E.healthOutcomeDisparityClosed))))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
