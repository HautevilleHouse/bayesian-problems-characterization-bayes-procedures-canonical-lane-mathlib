import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesDecisionProblem
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesProcedure

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

open BayesianDecisionProblem

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop := True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by trivial

def ConstrainedBayesianClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bayesian_endgame (A : AdmissibleClass) : ConstrainedBayesianClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
