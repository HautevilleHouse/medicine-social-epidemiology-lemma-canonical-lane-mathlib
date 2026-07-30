import MedicineSocialEpidemiologyLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure SocialEpidemiologyLemmaPackage where
  population : ℕ
  exposedFraction : ℝ
  outcomeHazard : ℝ → ℝ
  effectSize : ℝ

structure SocialEpidemiologyLemmaEvidence (S : SocialEpidemiologyLemmaPackage) where
  populationClosed : S.population > 0
  exposedFractionClosed : 0 ≤ S.exposedFraction ∧ S.exposedFraction ≤ 1
  hazardNonnegativeClosed : ∀ t, S.outcomeHazard t ≥ 0
  effectSizeClosed : S.effectSize > 0

def SocialEpidemiologyLemmaClosed (S : SocialEpidemiologyLemmaPackage) : Prop :=
  S.population > 0 ∧ (0 ≤ S.exposedFraction ∧ S.exposedFraction ≤ 1) ∧ (∀ t, S.outcomeHazard t ≥ 0) ∧ S.effectSize > 0

theorem social_epidemiology_lemma_closed_from_evidence (S : SocialEpidemiologyLemmaPackage) (E : SocialEpidemiologyLemmaEvidence S) :
    SocialEpidemiologyLemmaClosed S := by
  exact And.intro E.populationClosed (And.intro E.exposedFractionClosed (And.intro E.hazardNonnegativeClosed E.effectSizeClosed))

-- Attributable fraction in the exposed
def attributableFraction (S : SocialEpidemiologyLemmaPackage) : ℝ :=
  1 - 1 / S.effectSize

theorem attributable_fraction_between_zero_and_one (S : SocialEpidemiologyLemmaPackage) (closed : SocialEpidemiologyLemmaClosed S) :
    0 ≤ attributableFraction S ∧ attributableFraction S ≤ 1 := by
  unfold attributableFraction
  have h : S.effectSize > 0 := closed.2.2.2
  have h' : 1 / S.effectSize > 0 := by
    exact div_pos (by norm_num) h
  have h'' : 1 - 1 / S.effectSize ≤ 1 := by
    linarith
  have h''' : 1 - 1 / S.effectSize ≥ 0 := by
    nlinarith
  exact And.intro h''' h''

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse