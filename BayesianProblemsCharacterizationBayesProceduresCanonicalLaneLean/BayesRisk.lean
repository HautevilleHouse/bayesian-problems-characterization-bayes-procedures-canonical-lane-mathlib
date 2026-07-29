import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.LossFunction

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesRiskPackage (L : LossFunctionPackage) where
  priorDistribution : Type u
  posteriorRisk : priorDistribution → L.decisionSpace → Prop
  integratedRisk : Prop
  bayesRiskValue : Prop

structure BayesRiskEvidence {L : LossFunctionPackage} (B : BayesRiskPackage L) where
  posteriorRiskClosed : ∀ (π : B.priorDistribution) (d : L.decisionSpace), B.posteriorRisk π d
  integratedRiskClosed : B.integratedRisk
  bayesRiskValueClosed : B.bayesRiskValue

def BayesRiskClosed {L : LossFunctionPackage} (B : BayesRiskPackage L) : Prop :=
  B.integratedRisk ∧ B.bayesRiskValue

theorem bayes_risk_closed_from_evidence {L : LossFunctionPackage} (B : BayesRiskPackage L) (E : BayesRiskEvidence B) : BayesRiskClosed B := by
  exact And.intro E.integratedRiskClosed E.bayesRiskValueClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse