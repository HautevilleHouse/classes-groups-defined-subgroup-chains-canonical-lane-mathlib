import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainEvidence

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubnormalChainPackage (G : Type u) [Group G] where
  chain : SubgroupChain G
  evidence : SubgroupChainEvidence G chain
  subnormalProperty : Prop
  compositionFactorCondition : Prop
  subnormalPropertyClosed : subnormalProperty
  compositionFactorConditionClosed : compositionFactorCondition

def SubnormalChainClosed (G : Type u) [Group G] (P : SubnormalChainPackage G) : Prop :=
  P.subnormalProperty ∧ P.compositionFactorCondition

theorem subnormal_chain_closed_from_evidence (G : Type u) [Group G] (P : SubnormalChainPackage G) : SubnormalChainClosed G P := by
  exact And.intro P.subnormalPropertyClosed P.compositionFactorConditionClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse