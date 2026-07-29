import canonicalLaneMathlib.AdmissibleClass
import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.AdmissibleClass
import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesianAnalyticFoundation where
  decisionSpace : BayesianDecisionSpace
  prior : decisionSpace.stateSpace → ℝ
  loss : decisionSpace.stateSpace → decisionSpace.actionSpace → ℝ
  decisionRule : decisionSpace.actionSpace
  bayesRisk : ℝ
  isBayesOptimal : Prop
  bayesOptimalProof : isBayesOptimal

def BayesianAnalyticFoundation.toAdmissibleClass (F : BayesianAnalyticFoundation) : AdmissibleClass := {
  object := {
    decisionSpace := F.decisionSpace
    decisionRule := F.decisionRule
    bayesRisk := F.bayesRisk
    isBayesOptimal := F.isBayesOptimal
    conclusion := F.bayesOptimalProof
  },
  endpointSatisfied := F.isBayesOptimal,
  remainderRecorded := False,
  gateWitness := Or.inl F.bayesOptimalProof
}

theorem bayesian_analytic_foundation_closure (F : BayesianAnalyticFoundation) :
    ConstrainedBayesianClosure (F.toAdmissibleClass) := by
  exact constrained_bayesian_endgame (F.toAdmissibleClass)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse