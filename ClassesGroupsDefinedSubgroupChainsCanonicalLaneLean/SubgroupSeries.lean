import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.GroupClassChain

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupSeriesPackage {P : GroupClassChainPackage} where
  seriesLength : Nat
  seriesOfSubgroups : Fin (seriesLength+1) → Set P.underlyingGroup
  inclusionCondition : ∀ i : Fin seriesLength,
    seriesOfSubgroups (Fin.castSucc i) ⊆ seriesOfSubgroups (Fin.succ i)
  properInclusion : ∀ i : Fin seriesLength,
    seriesOfSubgroups (Fin.castSucc i) ≠ seriesOfSubgroups (Fin.succ i)

structure SubgroupSeriesEvidence {P : GroupClassChainPackage}
    (S : SubgroupSeriesPackage P) where
  inclusionConditionClosed : S.inclusionCondition
  properInclusionClosed : S.properInclusion

def SubgroupSeriesClosed {P : GroupClassChainPackage}
    (S : SubgroupSeriesPackage P) : Prop :=
  S.inclusionCondition ∧ S.properInclusion

theorem subgroup_series_closed_from_evidence {P : GroupClassChainPackage}
    (S : SubgroupSeriesPackage P) (E : SubgroupSeriesEvidence S) :
    SubgroupSeriesClosed S := by
  exact And.intro E.inclusionConditionClosed E.properInclusionClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse