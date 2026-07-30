import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyLemmaCanonicalLaneLean

structure CausalInferencePackage where
  exposure : Type u
  outcome : Type v
  counterfactual : Prop
  confoundingControl : Prop
  directedAcyclicGraph : Prop
  instrumentalVariable : Prop
  causalEffectEstimate : Prop

structure CausalInferenceEvidence (C : CausalInferencePackage) where
  counterfactualClosed : C.counterfactual
  confoundingControlClosed : C.confoundingControl
  directedAcyclicGraphClosed : C.directedAcyclicGraph
  instrumentalVariableClosed : C.instrumentalVariable
  causalEffectEstimateClosed : C.causalEffectEstimate

def CausalInferenceClosed (C : CausalInferencePackage) : Prop :=
  C.counterfactual ∧ C.confoundingControl ∧ C.directedAcyclicGraph ∧
  C.instrumentalVariable ∧ C.causalEffectEstimate

theorem causal_inference_closed_from_evidence (C : CausalInferencePackage)
    (E : CausalInferenceEvidence C) : CausalInferenceClosed C := by
  exact And.intro E.counterfactualClosed
    (And.intro E.confoundingControlClosed
      (And.intro E.directedAcyclicGraphClosed
        (And.intro E.instrumentalVariableClosed E.causalEffectEstimateClosed)))

end MedicineSocialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
