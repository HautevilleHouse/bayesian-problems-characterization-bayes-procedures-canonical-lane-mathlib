import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.DecisionTheoryPackage

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesProcedureCharacterizationPackage {M : StatisticalModelPackage}
    {stat : StatisticalModelClosed M} {D : DecisionTheoryPackage stat} (decClosed : DecisionTheoryClosed D) where
  bayesProcedure : Prop
  admissibility : Prop
  characterization : Prop
  bayesProcedureDefined : bayesProcedure
  admissibilityProved : admissibility
  characterizationProved : characterization

structure BayesProcedureCharacterizationEvidence {M : StatisticalModelPackage}
    {stat : StatisticalModelClosed M} {D : DecisionTheoryPackage stat}
    {decClosed : DecisionTheoryClosed D} (B : BayesProcedureCharacterizationPackage decClosed) where
  bayesProcedureClosed : B.bayesProcedure
  admissibilityClosed : B.admissibility
  characterizationClosed : B.characterization

def BayesProcedureCharacterizationClosed {M : StatisticalModelPackage}
    {stat : StatisticalModelClosed M} {D : DecisionTheoryPackage stat}
    {decClosed : DecisionTheoryClosed D} (B : BayesProcedureCharacterizationPackage decClosed) : Prop :=
  B.bayesProcedure ∧ B.admissibility ∧ B.characterization

theorem bayes_procedure_characterization_closed_from_evidence {M : StatisticalModelPackage}
    {stat : StatisticalModelClosed M} {D : DecisionTheoryPackage stat}
    {decClosed : DecisionTheoryClosed D} (B : BayesProcedureCharacterizationPackage decClosed)
    (E : BayesProcedureCharacterizationEvidence B) : BayesProcedureCharacterizationClosed B := by
  exact And.intro E.bayesProcedureClosed
    (And.intro E.admissibilityClosed E.characterizationClosed)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
