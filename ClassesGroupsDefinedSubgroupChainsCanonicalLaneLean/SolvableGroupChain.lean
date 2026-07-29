import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainEvidence

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SolvableGroupChainPackage (G : Type u) [Group G] where
  chain : SubgroupChain G
  evidence : SubgroupChainEvidence G chain
  abelianQuotients : Prop
  finiteLength : Prop
  abelianQuotientsClosed : abelianQuotients
  finiteLengthClosed : finiteLength

def SolvableGroupChainClosed (G : Type u) [Group G] (P : SolvableGroupChainPackage G) : Prop :=
  P.abelianQuotients ∧ P.finiteLength

theorem solvable_group_chain_closed_from_evidence (G : Type u) [Group G] (P : SolvableGroupChainPackage G) : SolvableGroupChainClosed G P := by
  exact And.intro P.abelianQuotientsClosed P.finiteLengthClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse