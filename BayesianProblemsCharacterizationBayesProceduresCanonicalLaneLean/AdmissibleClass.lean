import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse