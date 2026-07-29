import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure CompositionSeries (G : Type) [Group G] where
  chain : SubgroupChain G
  isCompositionSeries : ∀ i, i < chain.length → IsMaximal (chain.groups[i]) (chain.groups[i+1])
  normalizationFactor : ℕ

structure CompositionSeriesPackage (G : Type) [Group G] where
  compositionSeries : CompositionSeries G
  jordanHolderProperty : Prop
  factorGroupType : Type u
  factorGroupIsSimple : factorGroupType → Prop
  factorGroupCount : ℕ

structure CompositionSeriesEvidence {G : Type} [Group G] (P : CompositionSeriesPackage G) where
  jordanHolderPropertyClosed : P.jordanHolderProperty
  factorGroupCountClosed : P.factorGroupCount = P.compositionSeries.chain.length

def CompositionSeriesClosed {G : Type} [Group G] (P : CompositionSeriesPackage G) : Prop :=
  P.jordanHolderProperty ∧ (P.factorGroupCount = P.compositionSeries.chain.length)

theorem composition_series_closed_from_evidence {G : Type} [Group G]
    (P : CompositionSeriesPackage G) (E : CompositionSeriesEvidence P) : CompositionSeriesClosed P := by
  exact And.intro E.jordanHolderPropertyClosed E.factorGroupCountClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse