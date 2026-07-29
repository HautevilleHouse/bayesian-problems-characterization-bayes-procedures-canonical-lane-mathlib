import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse