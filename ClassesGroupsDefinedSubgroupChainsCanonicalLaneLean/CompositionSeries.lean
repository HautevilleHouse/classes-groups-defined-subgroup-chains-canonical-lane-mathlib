import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainStructure

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure CompositionSeries (S : SubgroupChainStructure) where
  length : ℕ
  indices : Fin (length + 1) → S.indexType
  chainCondition : ∀ (k : Fin length), S.chainIndex (indices ⟨k.val, by omega⟩) (indices ⟨k.val + 1, by omega⟩)
  maximalStep : ∀ (k : Fin length), ∃ (M : MaximalSubgroup S), S.subgroupAt (indices ⟨k.val + 1, by omega⟩) = S.subgroupAt (indices ⟨k.val, by omega⟩) ∧ M.maximalIndex = indices ⟨k.val + 1, by omega⟩

structure CompositionSeriesEvidence (S : SubgroupChainStructure) (C : CompositionSeries S) where
  chainConditionClosed : C.chainCondition
  maximalStepClosed : C.maximalStep

def CompositionSeriesClosed (S : SubgroupChainStructure) (C : CompositionSeries S) : Prop :=
  C.chainCondition ∧ C.maximalStep

theorem composition_series_closed_from_evidence (S : SubgroupChainStructure) (C : CompositionSeries S)
    (E : CompositionSeriesEvidence S C) : CompositionSeriesClosed S C := by
  exact And.intro E.chainConditionClosed E.maximalStepClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse