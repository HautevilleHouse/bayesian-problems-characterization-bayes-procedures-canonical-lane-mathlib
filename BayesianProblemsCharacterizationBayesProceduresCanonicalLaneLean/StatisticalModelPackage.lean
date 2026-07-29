import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure StatisticalModelPackage where
  priorMeasure : Prop
  likelihoodFunction : Prop
  posteriorComputation : Prop
  priorMeasureWellDefined : priorMeasure
  likelihoodFunctionWellDefined : likelihoodFunction
  posteriorComputationWellDefined : posteriorComputation

structure StatisticalModelEvidence (M : StatisticalModelPackage) where
  priorMeasureClosed : M.priorMeasure
  likelihoodFunctionClosed : M.likelihoodFunction
  posteriorComputationClosed : M.posteriorComputation

def StatisticalModelClosed (M : StatisticalModelPackage) : Prop :=
  M.priorMeasure ∧ M.likelihoodFunction ∧ M.posteriorComputation

theorem statistical_model_closed_from_evidence (M : StatisticalModelPackage)
    (E : StatisticalModelEvidence M) : StatisticalModelClosed M := by
  exact And.intro E.priorMeasureClosed
    (And.intro E.likelihoodFunctionClosed E.posteriorComputationClosed)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
