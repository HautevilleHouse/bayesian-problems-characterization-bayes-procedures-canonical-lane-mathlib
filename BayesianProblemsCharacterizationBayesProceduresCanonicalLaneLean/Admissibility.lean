import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesRule

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure AdmissibilityPackage {L : LossFunctionPackage} {B : BayesRiskPackage L} {R : BayesRulePackage L B} where
  inadmissibleDecision : L.decisionSpace
  dominatingBayesRule : R.decisionRule
  improvementOverInadmissible : Prop
  minimaxDecision : L.decisionSpace
  minimaxRiskValue : Prop

structure AdmissibilityEvidence {L : LossFunctionPackage} {B : BayesRiskPackage L} {R : BayesRulePackage L B} (A : AdmissibilityPackage L B R) where
  improvementOverInadmissibleClosed : A.improvementOverInadmissible
  minimaxRiskValueClosed : A.minimaxRiskValue

def AdmissibilityClosed {L : LossFunctionPackage} {B : BayesRiskPackage L} {R : BayesRulePackage L B} (A : AdmissibilityPackage L B R) : Prop :=
  A.improvementOverInadmissible ∧ A.minimaxRiskValue

theorem admissibility_closed_from_evidence {L : LossFunctionPackage} {B : BayesRiskPackage L} {R : BayesRulePackage L B} (A : AdmissibilityPackage L B R) (E : AdmissibilityEvidence A) : AdmissibilityClosed A := by
  exact And.intro E.improvementOverInadmissibleClosed E.minimaxRiskValueClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse