import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesianDecisionSpace where
  stateSpace : Type
  actionSpace : Type
  prior : stateSpace → ℝ
  loss : stateSpace → actionSpace → ℝ

structure BayesianAdmittedObject where
  decisionSpace : BayesianDecisionSpace
  decisionRule : decisionSpace.actionSpace
  bayesRisk : ℝ
  isBayesOptimal : Prop
  conclusion : isBayesOptimal

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.isBayesOptimal

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse