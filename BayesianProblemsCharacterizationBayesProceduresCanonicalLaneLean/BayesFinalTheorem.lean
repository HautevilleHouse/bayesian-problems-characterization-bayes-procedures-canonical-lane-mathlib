import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

def ConstrainedBayesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bayes_endgame (A : AdmissibleClass) :
    ConstrainedBayesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse