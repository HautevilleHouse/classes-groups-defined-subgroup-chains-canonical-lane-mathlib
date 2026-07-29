import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupChainEvidence (G : Type u) [Group G] (C : SubgroupChain G) where
  chainPropertyClosed : ∀ i j, i ≤ j → C.subgroups.get? i ≤ C.subgroups.get? j
  chainPropertyTerm : chainPropertyClosed

def SubgroupChainClosed (G : Type u) [Group G] (C : SubgroupChain G) : Prop :=
  ∀ i j, i ≤ j → C.subgroups.get? i ≤ C.subgroups.get? j

theorem subgroup_chain_closed_from_evidence (G : Type u) [Group G] (C : SubgroupChain G) (E : SubgroupChainEvidence G C) : SubgroupChainClosed G C := by
  exact E.chainPropertyClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse