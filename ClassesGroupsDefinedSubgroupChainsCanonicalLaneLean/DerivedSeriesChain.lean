import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure DerivedSeriesChain (G : Type) [Group G] where
  chain : List (Subgroup G)
  length : ℕ := chain.length
  isDerivedSeries : ∀ i, i < length → chain[i] = (derivedSubgroup (chain[i-1])) 
  triviallySolvable : chain[length-1] = ⊥

structure DerivedSeriesChainPackage (G : Type) [Group G] where
  derivedChain : DerivedSeriesChain G
  solvabilityWitness : Prop
  lengthMinimal : Prop

structure DerivedSeriesChainEvidence {G : Type} [Group G] (P : DerivedSeriesChainPackage G) where
  solvabilityWitnessClosed : P.solvabilityWitness
  lengthMinimalClosed : P.lengthMinimal

def DerivedSeriesChainClosed {G : Type} [Group G] (P : DerivedSeriesChainPackage G) : Prop :=
  P.solvabilityWitness ∧ P.lengthMinimal

theorem derived_series_chain_closed_from_evidence {G : Type} [Group G]
    (P : DerivedSeriesChainPackage G) (E : DerivedSeriesChainEvidence P) : DerivedSeriesChainClosed P := by
  exact And.intro E.solvabilityWitnessClosed E.lengthMinimalClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse