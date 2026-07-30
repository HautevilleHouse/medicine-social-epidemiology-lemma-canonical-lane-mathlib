import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatio : Prop
  prevalence : Prop
  receiverOperatingCharacteristic : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioClosed : D.likelihoodRatio
  prevalenceClosed : D.prevalence
  receiverOperatingCharacteristicClosed : D.receiverOperatingCharacteristic

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.likelihoodRatio ∧ D.prevalence ∧
  D.receiverOperatingCharacteristic

theorem diagnostic_inference_closed_from_evidence
    (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.likelihoodRatioClosed
            (And.intro E.prevalenceClosed E.receiverOperatingCharacteristicClosed)))))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse