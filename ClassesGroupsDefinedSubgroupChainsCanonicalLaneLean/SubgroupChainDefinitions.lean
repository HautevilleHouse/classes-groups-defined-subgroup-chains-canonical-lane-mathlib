import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupChain (G : Type) [Group G] where
  groups : List (Subgroup G)
  chainProperty : ∀ i j, i < j → groups[i] ≤ groups[j]
  length : ℕ := groups.length

structure SubgroupChainPackage (G : Type) [Group G] where
  chain : SubgroupChain G
  normalCondition : Prop
  indexCondition : Prop
  finitenessCondition : Prop

structure SubgroupChainEvidence {G : Type} [Group G] (P : SubgroupChainPackage G) where
  normalConditionClosed : P.normalCondition
  indexConditionClosed : P.indexCondition
  finitenessConditionClosed : P.finitenessCondition

def SubgroupChainClosed {G : Type} [Group G] (P : SubgroupChainPackage G) : Prop :=
  P.normalCondition ∧ P.indexCondition ∧ P.finitenessCondition

theorem subgroup_chain_closed_from_evidence {G : Type} [Group G]
    (P : SubgroupChainPackage G) (E : SubgroupChainEvidence P) : SubgroupChainClosed P := by
  exact And.intro E.normalConditionClosed (And.intro E.indexConditionClosed E.finitenessConditionClosed)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse